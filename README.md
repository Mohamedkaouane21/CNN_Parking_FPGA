# Last_Project / Supervision système Vision

### Système de supervision et de détection de places de parking sur Raspberry Pi

`Last_Project / Supervision système Vision` est une application conçue pour fonctionner sur Raspberry Pi afin de superviser un espace de stationnement, analyser l’occupation des places et proposer une interface web locale pour la visualisation et la configuration.

---

## Présentation

Ce projet a été pensé pour offrir une solution simple, lisible et exploitable sur une machine embarquée comme un Raspberry Pi.

L’application repose sur trois idées principales :

- observer l’état d’un parking à partir d’une logique de vision
- restituer les informations via une interface web locale
- conserver un fonctionnement stable sur une machine légère dédiée au projet

Cette branche correspond à la version utilisée pour l’environnement Raspberry Pi.

---

## Objectif du projet

`Last_Project / Supervision système Vision` a pour objectif de permettre :

- la supervision d’un parking
- l’identification de l’occupation des places
- la consultation des résultats via une interface web locale
- l’ajustement de certains paramètres de fonctionnement

Le système peut servir de base de démonstration, de prototypage ou d’exploitation dans un contexte de vision embarquée et de supervision.

---

## Fonctionnalités principales

- Détection de l’occupation des places de parking
- Interface web locale pour la visualisation
- Gestion de paramètres et de zones de détection
- Prise en charge de captures, vidéos et modèles associés
- Déploiement sur Raspberry Pi
- Fonctionnement continu avec service système

---

## Utilisation générale

Le projet est prévu pour être exécuté directement sur le Raspberry Pi.

Une fois installé et configuré, il permet notamment :

- de faire fonctionner le système de supervision
- d’accéder à l’interface web locale
- de consulter l’état du parking
- d’adapter certains réglages lorsque cela est nécessaire

L’ensemble a été organisé pour rester simple à utiliser et cohérent avec un usage sur machine dédiée.

---

## Structure du projet

```text
parking/
├── parking_server.py
├── parking_ui/
│   ├── static/
│   └── templates/
├── setup.sh
├── captures/
├── data/
├── models/
└── videos/
