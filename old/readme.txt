Entrainement du modele 

python emptyparkingspotdetectionmodel.py \
  --data-dir data \
  --out models/parking_cnn.h5


Tracer les coordoonnées:  
python label_coords.py \
  --image assets/parkingarea.png \
  --out outputs/coords.json  



Lancer la detection sur l'image :
python emptyparkingspotdetectionsystem.py \
  --image assets/parkingarea.png \
  --coords outputs/coords.json \
  --model models/parking_cnn.h5 \
  --out outputs/result.png \
  --threshold 0.5