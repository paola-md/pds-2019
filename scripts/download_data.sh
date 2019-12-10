#!/bin/bash

# """
# La función de este script es ejecutar
# los archivos sql para crear los esquemas
# , cargar los datos, limpiar las tablas
# crear las tablas semanticas, crear los 
# cohort y las características
# """

echo "Recoleccion de datos"
mkdir ./../data2
curl https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv > ./../data2/Artists.csv
curl https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv > ./../data2/Artworks.csv
