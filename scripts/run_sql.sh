#!/bin/bash

# """
# La función de este script es ejecutar
# los archivos sql para crear los esquemas
# , cargar los datos, limpiar las tablas
# crear las tablas semanticas, crear los 
# cohort y las características
# """

cd ./../moma

./moma.py create-schemas
echo "Schemas created"

./moma.py create-raw-tables
echo "Raw tables greated"

./moma.py load-moma
echo "Data Loaded"

./moma.py create-clean-tables
echo "Clean tables created"

./moma.py create-semantic-tables
echo "Semantic tables created"

./moma.py create-cohort
echo "Cohort created"

./moma.py create-labels
echo "Labels created"

#./moma.py create-features
echo "Features created"