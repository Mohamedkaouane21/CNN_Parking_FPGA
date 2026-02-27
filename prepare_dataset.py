"""
prepare_dataset.py
------------------
Pipeline complet pour enrichir le dataset de parking depuis des vidéos MP4.

Étapes :
  1. Extraction de 1 frame par minute depuis la vidéo
  2. Découpe des ROIs avec coords.json (transformation de perspective)
  3. Interface d'étiquetage manuelle ROI par ROI avec prévisualisation
  4. Sauvegarde dans la structure dataset (libre/ et occupee/)

Usage :
  python3 prepare_dataset.py --video ma_video.mp4 --coords coords_video1.json --out dataset_new/

Touches pendant l'étiquetage :
  l = LIBRE       o = OCCUPEE
  s = SKIP        (ROI ambiguë : ombre, passage de personne, flou)
  q = QUITTER     (sauvegarde l'état, relançable)
  z = UNDO        (annule le dernier étiquetage)
"""

import argparse
import cv2
import json
import numpy as np
import os
import csv
from pathlib import Path
from datetime import timedelta

# ── Paramètres ────────────────────────────────────────────────────────────────
FRAME_INTERVAL_S = 60       # 1 frame par minute
ROI_SIZE         = 48       # sortie 48x48 pixels
DISPLAY_SCALE    = 6        # affichage agrandi x6 pour mieux voir
DISPLAY_W        = 800      # largeur de la fenêtre de contexte

# ── Helpers ───────────────────────────────────────────────────────────────────
def extract_roi(frame, polygon):
    """Transforme un polygone quelconque en ROI 48x48 niveaux de gris."""
    pts = np.array(polygon, dtype=np.float32)
    dst = np.array([[0,0],[ROI_SIZE-1,0],[ROI_SIZE-1,ROI_SIZE-1],[0,ROI_SIZE-1]],
                   dtype=np.float32)
    M = cv2.getPerspectiveTransform(pts, dst)
    roi = cv2.warpPerspective(frame, M, (ROI_SIZE, ROI_SIZE))
    if len(roi.shape) == 3:
        roi = cv2.cvtColor(roi, cv2.COLOR_BGR2GRAY)
    return roi

def draw_context(frame, slots, current_slot_idx, label_counts):
    """Affiche le frame complet avec les places annotées."""
    vis = cv2.resize(frame, (DISPLAY_W, int(frame.shape[0] * DISPLAY_W / frame.shape[1])))
    scale_x = DISPLAY_W / frame.shape[1]
    scale_y = vis.shape[0] / frame.shape[0]

    for i, slot in enumerate(slots):
        pts = (np.array(slot, dtype=np.float32) * [scale_x, scale_y]).astype(np.int32)
        if i < current_slot_idx:
            color = (200, 200, 200)  # gris = déjà étiqueté
        elif i == current_slot_idx:
            color = (0, 255, 255)   # jaune = en cours
        else:
            color = (100, 100, 100) # sombre = pas encore

        cv2.polylines(vis, [pts], isClosed=True, color=color, thickness=2)
        cx = int(np.mean([p[0] for p in pts]))
        cy = int(np.mean([p[1] for p in pts]))
        cv2.putText(vis, str(i), (cx-8, cy+5),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.45, color, 1)

    # Compteurs en haut
    info = f"LIBRE: {label_counts['libre']}  OCCUPEE: {label_counts['occupee']}  SKIP: {label_counts['skip']}"
    cv2.putText(vis, info, (10, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255,255,255), 1)
    return vis

def make_display_roi(roi_gray):
    """Agrandit la ROI pour l'affichage."""
    big = cv2.resize(roi_gray, (ROI_SIZE * DISPLAY_SCALE, ROI_SIZE * DISPLAY_SCALE),
                     interpolation=cv2.INTER_NEAREST)
    return cv2.cvtColor(big, cv2.COLOR_GRAY2BGR)

def get_video_duration(cap):
    fps = cap.get(cv2.CAP_PROP_FPS)
    total_frames = cap.get(cv2.CAP_PROP_FRAME_COUNT)
    return int(total_frames / fps) if fps > 0 else 0

# ── Extraction des frames ─────────────────────────────────────────────────────
def extract_frames(video_path, out_dir):
    """Extrait 1 frame par minute et les sauvegarde."""
    frames_dir = Path(out_dir) / "frames"
    frames_dir.mkdir(parents=True, exist_ok=True)

    cap = cv2.VideoCapture(str(video_path))
    if not cap.isOpened():
        raise FileNotFoundError(f"Impossible d'ouvrir : {video_path}")

    fps = cap.get(cv2.CAP_PROP_FPS)
    duration_s = get_video_duration(cap)
    interval_frames = int(fps * FRAME_INTERVAL_S)

    print(f"Vidéo : {video_path.name}")
    print(f"  FPS={fps:.1f}, Durée={timedelta(seconds=duration_s)}, Intervalle={FRAME_INTERVAL_S}s")
    expected = duration_s // FRAME_INTERVAL_S
    print(f"  Frames attendues : ~{expected}")

    frame_idx = 0
    saved = 0
    existing = sorted(frames_dir.glob("*.png"))

    if existing:
        print(f"  {len(existing)} frames déjà extraites, on continue...")
        cap.release()
        return [str(f) for f in existing]

    saved_paths = []
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        if frame_idx % interval_frames == 0:
            t = int(frame_idx / fps)
            fname = frames_dir / f"frame_{t:06d}s.png"
            cv2.imwrite(str(fname), frame)
            saved_paths.append(str(fname))
            saved += 1
            if saved % 10 == 0:
                print(f"  {saved} frames extraites ({timedelta(seconds=t)})...")
        frame_idx += 1

    cap.release()
    print(f"  Extraction terminée : {saved} frames")
    return saved_paths

# ── Interface d'étiquetage ────────────────────────────────────────────────────
def label_frames(frames_paths, slots, out_dir, video_name):
    """Interface interactive pour étiqueter les ROIs frame par frame."""
    libre_dir   = Path(out_dir) / "libre"
    occupee_dir = Path(out_dir) / "occupee"
    libre_dir.mkdir(parents=True, exist_ok=True)
    occupee_dir.mkdir(parents=True, exist_ok=True)

    # Fichier de progression pour pouvoir reprendre
    progress_file = Path(out_dir) / f"progress_{video_name}.csv"
    done = set()
    if progress_file.exists():
        with open(progress_file) as f:
            for row in csv.reader(f):
                if row:
                    done.add(row[0])
        print(f"Reprise : {len(done)} ROIs déjà étiquetées")

    label_counts = {'libre': 0, 'occupee': 0, 'skip': 0}
    history = []  # pour UNDO

    cv2.namedWindow("ROI", cv2.WINDOW_NORMAL)
    cv2.namedWindow("Contexte", cv2.WINDOW_NORMAL)

    progress_f = open(progress_file, 'a', newline='')
    writer = csv.writer(progress_f)

    total_frames = len(frames_paths)
    for fi, frame_path in enumerate(frames_paths):
        frame = cv2.imread(frame_path)
        if frame is None:
            continue

        frame_name = Path(frame_path).stem
        print(f"\nFrame {fi+1}/{total_frames} : {frame_name}")

        slot_idx = 0
        while slot_idx < len(slots):
            roi_key = f"{frame_name}_slot{slot_idx}"

            # Déjà étiqueté ?
            if roi_key in done:
                slot_idx += 1
                continue

            roi = extract_roi(frame, slots[slot_idx])

            # Affichage
            context = draw_context(frame, slots, slot_idx, label_counts)
            roi_big = make_display_roi(roi)

            # Légende sur la ROI
            cv2.putText(roi_big, f"Place {slot_idx}", (4, 20),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0,255,255), 1)
            cv2.putText(roi_big, "l=LIBRE  o=OCCUPEE", (4, 44),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255,255,255), 1)
            cv2.putText(roi_big, "s=SKIP  z=UNDO  q=QUIT", (4, 64),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, (200,200,200), 1)

            cv2.imshow("ROI", roi_big)
            cv2.imshow("Contexte", context)
            cv2.resizeWindow("ROI", ROI_SIZE*DISPLAY_SCALE, ROI_SIZE*DISPLAY_SCALE+30)

            key = cv2.waitKey(0) & 0xFF

            if key == ord('q'):
                print("\nSauvegarde et arrêt.")
                progress_f.close()
                cv2.destroyAllWindows()
                return label_counts

            elif key == ord('l'):
                # LIBRE
                fname = libre_dir / f"{video_name}_{roi_key}.png"
                cv2.imwrite(str(fname), roi)
                history.append(('libre', str(fname), roi_key))
                done.add(roi_key)
                writer.writerow([roi_key, 'libre'])
                progress_f.flush()
                label_counts['libre'] += 1
                print(f"  Place {slot_idx} -> LIBRE")
                slot_idx += 1

            elif key == ord('o'):
                # OCCUPEE
                fname = occupee_dir / f"{video_name}_{roi_key}.png"
                cv2.imwrite(str(fname), roi)
                history.append(('occupee', str(fname), roi_key))
                done.add(roi_key)
                writer.writerow([roi_key, 'occupee'])
                progress_f.flush()
                label_counts['occupee'] += 1
                print(f"  Place {slot_idx} -> OCCUPEE")
                slot_idx += 1

            elif key == ord('s'):
                # SKIP (ambigu)
                history.append(('skip', None, roi_key))
                done.add(roi_key)
                writer.writerow([roi_key, 'skip'])
                progress_f.flush()
                label_counts['skip'] += 1
                print(f"  Place {slot_idx} -> SKIP")
                slot_idx += 1

            elif key == ord('z') and history:
                # UNDO
                last_label, last_fname, last_key = history.pop()
                if last_fname and os.path.exists(last_fname):
                    os.remove(last_fname)
                done.discard(last_key)
                label_counts[last_label] = max(0, label_counts[last_label] - 1)
                print(f"  UNDO : {last_key} ({last_label}) annulé")
                slot_idx = max(0, slot_idx - 1)

    progress_f.close()
    cv2.destroyAllWindows()
    return label_counts

# ── Main ──────────────────────────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(description="Pipeline d'enrichissement dataset parking")
    parser.add_argument("--video",  required=True, help="Chemin vers le fichier MP4")
    parser.add_argument("--coords", required=True, help="Chemin vers coords.json")
    parser.add_argument("--out",    default="dataset_new", help="Dossier de sortie")
    args = parser.parse_args()

    video_path = Path(args.video)
    if not video_path.exists():
        raise FileNotFoundError(f"Vidéo introuvable : {video_path}")

    with open(args.coords) as f:
        slots = json.load(f)
    print(f"{len(slots)} places chargées depuis {args.coords}")

    video_name = video_path.stem.replace(" ", "_")

    # 1. Extraction des frames
    print("\n── Étape 1 : Extraction des frames ──")
    frames = extract_frames(video_path, args.out)
    print(f"Total frames disponibles : {len(frames)}")

    # 2. Étiquetage
    print("\n── Étape 2 : Étiquetage ──")
    print("Raccourcis : l=LIBRE  o=OCCUPEE  s=SKIP  z=UNDO  q=QUIT\n")
    counts = label_frames(frames, slots, args.out, video_name)

    # Résumé
    total = counts['libre'] + counts['occupee']
    print(f"\n{'='*40}")
    print(f"RÉSUMÉ")
    print(f"  LIBRE   : {counts['libre']}")
    print(f"  OCCUPEE : {counts['occupee']}")
    print(f"  SKIP    : {counts['skip']}")
    print(f"  TOTAL   : {total} images étiquetées")
    print(f"\nImages sauvegardées dans : {args.out}/libre/ et {args.out}/occupee/")
    print(f"Progression sauvegardée  : {args.out}/progress_{video_name}.csv")
    print(f"(Relancez le script pour continuer si vous avez quitté)")

if __name__ == "__main__":
    main()
