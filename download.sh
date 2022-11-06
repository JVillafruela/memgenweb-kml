#!/bin/bash

[[ ! -d download ]] && mkdir download

curl -L https://www.memorialgenweb.org/memodiv/telecharg/mam_google_maps.kml -o download/monuments_sans_photo.kml

curl -L https://www.memorialgenweb.org/memodiv/telecharg/photos_google_maps.kml -o download/releves_sans_photo.kml

curl -L https://www.memorialgenweb.org/memodiv/telecharg/sources_google_maps.kml -o download/monuments_geolocalises.kml
