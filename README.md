# memgenweb-kml

Summary : Scripts to process kml files downloaded from [MémorialGenWeb](https://www.memorialgenweb.org) to make them compatible with the KML 2.2 specification

Scripts pour traiter les fichiers kml téléchargés du site [MémorialGenWeb](https://www.memorialgenweb.org).

Le traitement permet d'obtenir des fichiers conformes à la spécification kml 2.2.

## Traitements effectués

- Conversion du fichier en UTF-8
- Déclaration namespace en kml 2.2 au lieu de 2.0
- Suppression balise *altitudeMode* (causait une erreur de validation)
- Ajout CDATA dans *\<address>* à cause des tags *\<br />*
- Renumérotation des id *Placemark* et *Style* qui n'étaient pas uniques dans le cas où il y a plusieurs monuments dans une commune.
- Reformatage XML et validation par rapport au schéma kml 2.2


## Prérequis

Scripts testés sur Debian 11, nécessitent :
- bash
- awk
- curl
- xmllint (apt install libxml2-utils)

## Répertoires

- download : fichiers téléchargés (script download.sh)
- xsd : schema kml 2.2
- utf8 : fichiers résultat (script run.sh)

## Licence

Scripts publiés sous la licence GNU General Public License v3.0.