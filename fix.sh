#!/bin/bash

if [ $# -lt 2 ]; then echo "Usage : fix.sh fichier.kml resultat.kml"; exit 1; fi

if [ ! -f $1 ]
then
	echo "Fichier $1 non trouvé"
	exit 2;
fi

FILE=$1
OUTPUT=$2
TMP=/var/tmp/$(basename $FILE)

echo "Traitement fichier $FILE"

echo "Conversion en UTF8"
iconv -f windows-1252 -t UTF-8 $FILE >$TMP

echo "kml v2.2"
sed -i  "1,5s%http://earth.google.com/kml/2.0%http://www.opengis.net/kml/2.2%" $TMP

echo "Suppression altitudeMode"
sed -i  "s%<altitudeMode>absolute</altitudeMode>%%" $TMP

echo "Formatage XML"
# suppression des sauts de lignes pour pouvoir traiter les adresses dans le script awk (il y a en sur 2 lignes)
tr '\n' ' ' <$TMP | tr '\r' ' '  >$TMP.tmp
xmllint --format $TMP.tmp >$TMP

echo "Ajout CDATA dans <address>"
#<address>Monument aux Morts 1870-1871 01-Chanay (Ain)</address>
sed -i -E "s%<address>(.+)</address>%<address>\<!\[CDATA\[\1\]\]\></address>%"  $TMP


echo "Renumérotation id placemark et style"
awk -f placemark-id.awk <$TMP > $OUTPUT

rm $TMP $TMP.tmp
echo "Validation XML"
xmllint --noout --schema xsd/ogckml22.xsd $OUTPUT