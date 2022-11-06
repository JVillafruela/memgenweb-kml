#!/bin/bash


if [ ! -f download/monuments_sans_photo.kml ]; then echo "Fichier download/monuments_sans_photo.kml non trouvé"; exit 1; fi
if [ ! -f download/releves_sans_photo.kml ]; then echo "Fichier download/releves_sans_photo.kml non trouvé"; exit 1; fi
if [ ! -f download/monuments_geolocalises.kml ]; then echo "Fichier download/monuments_geolocalises.kml non trouvé"; exit 1; fi

bash fix.sh download/monuments_sans_photo.kml   utf8/monuments_sans_photo.kml
bash fix.sh download/releves_sans_photo.kml     utf8/releves_sans_photo.kml
bash fix.sh download/monuments_geolocalises.kml utf8/monuments_geolocalises.kml