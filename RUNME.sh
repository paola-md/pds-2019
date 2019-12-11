#!/bin/sh

# """
# La función de este script es correr
# todo el proyecto
# """

cd scripts

./create_db.sh
echo "Base de datos y usuarios creados"
./download_data.sh
echo "Datos descargados"
./run_sql.sh
echo "Datos transformados"