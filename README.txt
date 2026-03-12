========================================================
PARKING CAMERA CAPTURE SYSTEM – PYNQ-Z2
========================================================

DESCRIPTION
-----------
Ce projet permet à une carte PYNQ-Z2 de :
- détecter automatiquement une caméra Ethernet (via ARP)
- récupérer une image RTSP toutes les X secondes
- écraser l’image précédente pour éviter la saturation mémoire
- découper l’image en ROIs à partir d’un fichier JSON
- fonctionner en continu, même après redémarrage

Le système fonctionne sans PC connecté en permanence.


ARBORESCENCE DU PROJET
---------------------
/home/xilinx/parking_system/
│
├── code/
│   └── capture_rtsp.py        (script principal)
│
├── config/
│   └── coords.json            (zones / ROIs)
│
├── data/
│   ├── captures/              (latest.jpg)
│   └── rois/                  (images découpées)
│
├── logs/
│   └── capture.log
│
└── README.txt


LANCER LE SYSTÈME AUTOMATIQUEMENT (SYSTEMD)
------------------------------------------

Démarrer le service :
sudo systemctl start parking-camera.service

Arrêter le service :
sudo systemctl stop parking-camera.service

Redémarrer le service :
sudo systemctl restart parking-camera.service

Activer au démarrage :
sudo systemctl enable parking-camera.service

Vérifier l’état :
systemctl status parking-camera.service


CONSULTER LES LOGS
-----------------
tail -f /home/xilinx/parking_system/logs/capture.log


LANCER LE SCRIPT MANUELLEMENT (DEBUG)
------------------------------------
cd /home/xilinx/parking_system
python3 code/capture_rtsp.py


TRANSFERT DE FICHIERS (PC ↔ CARTE)
---------------------------------

Envoyer un fichier du PC vers la carte :
scp fichier.py xilinx@192.168.2.99:/home/xilinx/parking_system/code/

Envoyer un JSON :
scp coords.json xilinx@192.168.2.99:/home/xilinx/parking_system/config/

Récupérer une image depuis la carte :
scp xilinx@192.168.2.99:/home/xilinx/parking_system/data/captures/latest.jpg ~/Documents/


CONNEXION SSH
-------------
ssh xilinx@192.168.2.99


COMMANDES RÉSEAU UTILES
----------------------

Afficher les interfaces :
ip addr

Afficher les routes :
ip route

Ajouter une route par défaut :
sudo ip route add default via 192.168.2.30

Supprimer la route par défaut :
sudo ip route del default


DHCP SUR LA CARTE (SANS DNSMASQ)
-------------------------------
- Le serveur DHCP est déjà configuré sur la carte
- Il attribue automatiquement une IP à la caméra
- Le script détecte la caméra via ARP (ip neigh)
- Aucune IP n’est codée en dur


REMARQUES IMPORTANTES
--------------------
- Une seule caméra Ethernet prévue
- L’IP de la caméra peut changer (DHCP)
- latest.jpg est toujours écrasé
- En cas d’échec, un fichier echec.txt est généré
- Le système est autonome après démarrage
