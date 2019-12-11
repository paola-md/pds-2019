# Proyecto: Set de datos de "The Museum of Modern Art" (MoMA) 
Para este proyecto usamos los datos del **museo de arte moderno**, puedes descagrar una copia de la base [aquí](https://github.com/MuseumofModernArt/collection). Referencia: [![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.3524700.svg)](http://dx.doi.org/10.5281/zenodo.3524700)

Nuestro objetivo es clasificar si una obra de arte entrante es fotografía o no. En este proyecto no se soluciona el anterior problema de Machine Learning, sin embargo se evalúa haciendo uso de Python, SQL y bash para crear y limpiar la base de datos de MoMA así como también crear nuevas features.

## Estrucura de la base de datos
La base de datos está estructurada en dos tablas: artists y artworks.
Se pueden unir através de la variable ConstituentID que es un identificador único para los artistas. 

## Descripción de los datos
La figura muestra el diagrama entidad-relación (ERD) para la base de datos MoMa. Se muestran todos los atributos de las entidades.

![Alt text](results/entidad-relacion.png?raw=true "Title")

Cada artista (artist) tiene características que, para fines del proyecto, consideramos estáticas como nombre, nacionalidad, género, fecha de nacimento y fecha de muerte. Las obras de arte (artworks) también tienen características estáticas como título, medio, dimensiones y clasificación. Identificamos la fecha de adquisición como una característica dinámica.
La relación entre los artistas y las obras de arte es de muchos a muchos. Es decir, un artista puede tener muchas obras de arte y una obra de arte puede ser realizada por varios artistas.

Puedes consultar más información [aquí](https://github.com/MuseumofModernArt/collection)

**Descripción de las columnas de la entidad artistas**

|    ﻿elemento   |                         significado                         |                                     observación                                    |
|:-------------:|:-----------------------------------------------------------:|:----------------------------------------------------------------------------------:|
| ConstituentID | identificador único de cada artista                         |                                                                                    |
| DisplayName   | nombre y apellido del artista                               | algunos nombres contienen segundos nombres entre paréntesis o únicamente iniciales |
| ArtistBio     | concatena la nacionalidad con el año de nacimiento y muerte | cuando el artista no ha muerto utiliza la palabra born                             |
| Nationality   | nacionalidad del artista                                    |                                                                                    |
| Gender        | género del artista                                          | el género viene indicado con la palabra "Male" o "Female"                          |
| BeginDate     | fecha de nacimiento                                         |                                                                                    |
| EndDate       | fecha de muerte                                             |                                                                                    |
| Wiki QID      | identificador de Wikidata                                   | muchos valores faltantes                                                           |
| ULAN          | identificador de "Union List of Artist Names"               | muchos valores faltantes                                                           |


**Descripción de las columnas de la entidad obras de arte**

|    elemento   |                         significado                         |                                     observación                                    |
|:-------------:|:-----------------------------------------------------------:|:----------------------------------------------------------------------------------:|
|Title|	título de la obra|  |	
|Artist	|nombre y apellido del artista | |	
|ConstituentID | identificador único de cada artista	| |
|ArtistBio | concatena la nacionalidad con el año de nacimiento y muerte del artista	 | |
|Nationality|	nacionalidad del artista | |	
|BeginDate |	fecha de nacimiento del artista | |	
|EndDate |	fecha de muerte del artista	| |
|Gender |	género del artista | |	
|Date |	año de creación de la obra de arte	| |
|Medium|  	materiales con los que la obra de arte fue elaborada | |	
|Dimensions |	altura y anchura de la obra de arte expresado en in y cm ||	
|CreditLine  |	línea de crédito de la obra de arte	| |
|AccessionNumber | 	número de acceso de la obra de arte | |	
|Classification|	tipo de obra de arte	| |
|Department  |	departamento de la obra de arte	| |
|DateAcquired| 	año en que MoMA adquirio la obra de arte | |	
|Cataloged |	si la obra de arte está o no está catalogada | |	
|ObjectID |	identificador único de la obra de arte | |	
|URL  |	URL de la obra de arte en página web de Moma	| |
|ThumbnailURL |	URL en miniatura de la obra de arte en la página web del MoMA| |
|Circumference..cm.	|circunferencia de la obra de arte en cm	en caso de que aplique
|Depth..cm.   	|profundidad de la obra de arte en cm|	en caso de que aplique, en la mayoría de los casos no aplica |
|Diameter..cm. |	diametro de la obra de arte en cm	|en caso de que aplique, en la mayoría de los casos no aplica|
|Height..cm.|	altura de la obra de arte en cm	|en caso de que aplique, en la mayoría de los casos no aplica|
|Length..cm. |	longitud de la obra de en cm|	en caso de que aplique, en la mayoría de los casos no aplica|
|Weight..kg. |	peso de la obra de arte en kg|	en caso de que aplique, en la mayoría de los casos no aplica|
|Width..cm. | 	achura de la obra de arte en cm|	en caso de que aplique, en la mayoría de los casos no aplica|
|Seat.Height..cm. |	altura del lugar de la obra de arte en cm|	columna vacía|
|Duration..sec..|	duración de la obra de arte en segundos|	en caso de que aplique, en la mayoría de los casos no aplica|



## Instalación
A través de Vagrant se puede ejecutar el proyecto. 
Vagrant se debe descargar [aquí](https://www.vagrantup.com/downloads.html)
Archivos disponibles [aquí](https://github.com/ITAM-DS/programming-for-data-science-2019/tree/master/vagrant-ds)

Para prender la máquina virtual:
```
vagrant up
vagrant ssh
```

## Ejecución
1. Clonar este repositorio 
```
$ git clone https://github.com/paola-md/pds-2019.git
```

2. Moverse dentro del repositorio
```
$ cd pds-2019
```

3. Configurar poetry
```
pyenv shell system
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
pyenv shell --unset
source $HOME/.poetry/env
```

4. Ejecutar el archivo RUNME.sh
```
$ ./RUNME.sh
```
5. Ver carpeta tests para la comprobación de las tablas que se crearon.

## ¿Qué hace el archivo RUNME?
1. Construye el ambiente virtual moma (create_virual_env.sh)
2. Crea la base de datos el psql (create_db.sh)
3. Descarga los datos (download_data.sh)
4. Corre los archivos SQL (run_sql.sh)

## ¿Cómo se hizo la magia?
0. Carpetas
Para crear la estructura de carpetas se utilizó el archivo scripts/estructura_python.sh que crea las carpetas y agrega un archivo vacío en cada una.

1. Ambiente virtual
```
pyenv virtualenv 3.7.3 moma
echo 'moma' > .python-version 
```
Instalamos poetry
```
pyenv shell system
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
pyenv shell --unset
```
Creamos el archivo pyproject.toml (contiene las especificaciones de versiones semánticas).
```
poetry init 
poetry add numpy
poetry add dynaconf 
poetry add --dev flake8 
poetry add --dev flake8-docstrings 
poetry add --dev xdoctest 
poetry add --dev pydocstyle 
poetry add --dev black --allow-prereleases 
poetry add --dev mypy
poetry add --dev pytest-cov 
poetry add --dev pytest-mock
poetry add --dev coverage 
poetry add --dev tox 
poetry add --dev towncrier

poetry add --dev sphinx 
poetry add --dev sphinx_rtd_theme

poetry add psycopg2 --extras all 
```

En el RUNME esto no se ejecuta de nuevo. En cambio se utiliza el archivo pyproject.toml para instalar las dependencias
```
poetry install 
```

2. Creamos base de datos
```
$ sudo su postgres
$ psql 
$ create database moma;
```
Creamos un rol 
```
$ create role moma login ; 
$ alter role moma with encrypted password 'marmol'; 
$ grant all privileges on database moma to moma;
```
Para conectarnos de forma remota usamos
```
$ psql -U moma- d moma -h 0.0.0.0 -W
```

3. Los datos se descargan del repositorio del MoMa

4. Los archivos SQL se corren a través del archivo moma.py.

## Más sobre el flujo de trabajo
El flujo de trabajo fue el siguiente
1. create squemas
	- Se crearon los esquemas para organizar las tablas
2. create raw tables
	- Se copiaron las columnas de las dos tablas de datos como tipo texto
	* Se creo raw.artists y raw.artworks
3. to cleaned
	- Se elimiaron las variables redundantes y se codificó cada
	* Se creo cleaned.artists y cleaned.artworks
4. to semantic
	- Se elimiaron las variables redundantes y se codificó cada
	* Se creo cleaned.artists y cleaned.artworks
5. cohort 
	- Se elimiaron las variables redundantes y se codificó cada
	* Se creo cleaned.artists y cleaned.artworks
6. labels
	- Se elimiaron las variables redundantes y se codificó cada
	* Se creo cleaned.artists y cleaned.artworks
7. features
	- Se elimiaron las variables redundantes y se codificó cada
	* Se creo cleaned.artists y cleaned.artworks
