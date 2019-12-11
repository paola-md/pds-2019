#!/bin/bash

# """
# La función de este script es ejecutar
# los archivos sql para crear los esquemas,
# cargar los datos, limpiar las tablas
# crear las tablas semanticas, crear los 
# cohort y las características
# """

cd ./../moma

./moma.py create-schemas
echo "Esquemas creados"

./moma.py create-raw-tables
echo "Tablas raw creadas"

./moma.py load-moma
echo "Datos cargados"

./moma.py create-clean-tables
echo "Tablas clean creadas"

./moma.py create-semantic-tables
echo "Tablas semantic creadas"

./moma.py create-cohort
echo "Cohort creada"

./moma.py create-labels
echo "Labels creadas"

./moma.py create-features
echo "Features creadas"
