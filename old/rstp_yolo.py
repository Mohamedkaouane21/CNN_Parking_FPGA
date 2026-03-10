import cv2
import numpy as np
import time

MODEL_PATH = "yolov8n.onnx"
RTSP_URL = "rtsp://admin:TPRESEAU!@192.168.0.5:554/h264Preview_01_sub"

INPUT_SIZE = 320
CONF_THRESHOLD = 0.4
NMS_THRESHOLD = 0.45

SCREEN_W = 800
SCREEN_H = 480

CLASSES = [
    "person","bicycle","car","motorcycle","airplane","bus","train","truck",
    "boat","traffic light","fire hydrant","stop sign","parking meter","bench",
    "bird","cat","dog","horse","sheep","cow","elephant","bear","zebra",
    "giraffe","backpack","umbrella","handbag","tie","suitcase","frisbee",
    "skis","snowboard","sports ball","kite","baseball bat","baseball glove",
    "skateboard","surfboard","tennis racket","bottle","wine glass","cup",
    "fork","knife","spoon","bowl","banana","apple","sandwich","orange",
    "broccoli","carrot","hot dog","pizza","donut","cake","chair","couch",
    "potted plant","bed","dining table","toilet","tv","laptop","mouse",
    "remote","keyboard","cell phone","microwave","oven","toaster","sink",
    "refrigerator","book","clock","vase","scissors","teddy bear",
    "hair drier","toothbrush"
]

net = cv2.dnn.readNetFromONNX(MODEL_PATH)
net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)

cap = cv2.VideoCapture(RTSP_URL, cv2.CAP_FFMPEG)

if not cap.isOpened():
    print("Impossible d'ouvrir le flux RTSP")
    exit()

print("RTSP connecté")

# Création fenêtre fullscreen
cv2.namedWindow("YOLO", cv2.WND_PROP_FULLSCREEN)
cv2.setWindowProperty("YOLO", cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)

while True:
    ret, frame = cap.read()
    if not ret:
        continue

    h, w = frame.shape[:2]

    blob = cv2.dnn.blobFromImage(
        frame,
        1/255.0,
        (INPUT_SIZE, INPUT_SIZE),
        swapRB=True,
        crop=False
    )

    net.setInput(blob)

    start = time.time()
    outputs = net.forward()[0]
    end = time.time()

    fps = 1 / (end - start)

    outputs = outputs.transpose()

    boxes = []
    confidences = []
    class_ids = []

    for row in outputs:
        scores = row[4:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]

        if confidence > CONF_THRESHOLD:
            cx, cy, bw, bh = row[:4]

            x = int((cx - bw/2) * w / INPUT_SIZE)
            y = int((cy - bh/2) * h / INPUT_SIZE)
            bw = int(bw * w / INPUT_SIZE)
            bh = int(bh * h / INPUT_SIZE)

            boxes.append([x, y, bw, bh])
            confidences.append(float(confidence))
            class_ids.append(class_id)

    indices = cv2.dnn.NMSBoxes(boxes, confidences, CONF_THRESHOLD, NMS_THRESHOLD)

    if len(indices) > 0:
        for i in indices.flatten():
            x, y, bw, bh = boxes[i]
            label = CLASSES[class_ids[i]]

            cv2.rectangle(frame, (x, y), (x+bw, y+bh), (0,255,0), 2)
            cv2.putText(frame,
                        f"{label} {confidences[i]:.2f}",
                        (x, y-10),
                        cv2.FONT_HERSHEY_SIMPLEX,
                        0.5,
                        (0,255,0),
                        2)

    cv2.putText(frame,
                f"FPS: {fps:.2f}",
                (20,40),
                cv2.FONT_HERSHEY_SIMPLEX,
                1,
                (0,255,255),
                2)

    # Adapter à l'écran DSI
    frame_display = cv2.resize(frame, (SCREEN_W, SCREEN_H))

    cv2.imshow("YOLO", frame_display)

    if cv2.waitKey(1) & 0xFF == 27:
        break

cap.release()
cv2.destroyAllWindows()
