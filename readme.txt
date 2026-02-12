# Last_Project – Parking Slots (ROI + CNN)

This project classifies **parking slots** as **EMPTY** or **OCCUPIED** using:
- Manual slot polygons (quadrilaterals) saved in JSON
- A simple CNN binary classifier trained on slot crops (48×48 grayscale)

✅ All scripts have been updated to **avoid hard-coded paths**.  
Paths are provided via CLI arguments and default to a clean project structure.

## Project structure (recommended)

- `assets/parkingarea.png` : reference image
- `outputs/coords.json` : polygons (4 points per slot)
- `data/empty/` and `data/occupied/` : training images (slot crops)
- `models/parking_cnn.h5` : trained model
- `outputs/result.png` : inference overlay result

## 1) Label polygons (manual)

```bash
python label_coords.py --image assets/parkingarea.png --out outputs/coords.json
# or
python parkingspotcoordinate.py --image assets/parkingarea.png --out outputs/coords.json
```

## 2) Train the model

Put your training images into:
- `data/empty/`
- `data/occupied/`

Then:

```bash
python emptyparkingspotdetectionmodel.py --data-dir data --out models/parking_cnn.h5
```

## 3) Run inference

```bash
python emptyparkingspotdetectionsystem.py   --image assets/parkingarea.png   --coords outputs/coords.json   --model models/parking_cnn.h5   --out outputs/result.png   --threshold 0.5
```
