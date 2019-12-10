#!/bin/bash

# """
# La función de este script es ejecutar
# los archivos sql para crear los esquemas
# , cargar los datos, limpiar las tablas
# crear las tablas semanticas, crear los 
# cohort y las características
# """

echo "Recoleccion de datos"
wget -i moma_data.txt > ./../data2
