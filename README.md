# Proyecto: Set de datos de "The Museum of Modern Art" (MoMa) 
Para este proyecto usamos los datos del **museo de arte moderno**, puedes descagrar una copia de la base [aquí](https://github.com/MuseumofModernArt/collection). Referencia: [![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.3524700.svg)](http://dx.doi.org/10.5281/zenodo.3524700)

## Descripción de Entidad
La figura muestra el diagrama entidad-relación (ERD) para la base de datos MoMa. Se muestran todos los atributos de las entidades.

![Alt text](results/entidad-relacion.png?raw=true "Title")

Cada artista (artist) tiene características que, para fines del proyecto, consideramos estáticas como nombre, nacionalidad, género, fecha de nacimento y fecha de muerte. Las obras de arte (artworks) también tienen características estáticas como título, medio, dimensiones y clasificación. Identificamos la fecha de adquisición como una caraterística dinámica.
La relación entre los artistas y las obras de arte es de muchos a muchos. Es decir, un artista puede tener muchas obras de arte y una obra de arte puede ser realizada por varios artistas.
Puedes consultar más información [aquí](https://github.com/MuseumofModernArt/collection)

**Tabla describiendo las columnas de la entidad artistas**

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

## Estrucura de la base de datos
La base de datos está estructurada en dos tablas: artists y artworks.
Se pueden unir através de la variable ConsituentID que es un identificador único para los artistas. 


## Instalación
A través de Vagrant se puede ejecutar el proyecto. 
Vagrant se debe descargar [aquí](https://www.vagrantup.com/downloads.html)
Archivos disponibles [aquí](https://github.com/ITAM-DS/programming-for-data-science-2019/tree/master/vagrant-ds)

Para prender la máquina virtual:
```
vagrant up
vagrant ssh
```

A continuación, creamos un ambiente virtual
```
pyenv virtualenv 3.7.3 moma
echo ‘moma’ > .python-version 
```
Instalamos poetry
```
pyenv shell system curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python 
pyenv shell -unset 
```
Creamos el archivo pyproject.toml (contiene las especificaciones de versiones semánticas).
```
poetry init 
poetry add numpy --extras all 
poetry add toml
poetry add click 
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

## Ejecución
1. Clonar este repositorio 
```
$ git clone https://github.com/paola-md/pds-2019.git
```
2. Creamos base de datos
```
$ sudo su postgres
$ psql 
$ create database moma;
```
3. Creamos un rol 
```
$ create role moma login ; 
$ alter role moma with encrypted password 'marmol'; 
$ grant all privileges on database moma to moma;
```
Para conectarnos de forma remota usamos
```
$ psql -U moma- d moma -h 0.0.0.0 -W
```
4. Una vez creada la base de datos, corremos el archivo
RUNME.sh que ejecuta moma.py con los scripts sql. 

## Workflow
1. create squemas
2. create raw tables
3. to cleaned
4. to semantic
5. cohort new clients
6. labels
7. features


## Esto es para nosotros (después lo borramos)
6.2 ¿ Qué debo de hacer?
* Crear un repositorio (listo)
* Crear estructura de carpetas para un proyecto en python (copiar turista y berka)
* Escoger una fuente de datos (proponemos United States Sentencing Commission Individual Offender Data Sets)
* Crear un README.md: Describir la entidad, Estructura de la base de
datos, Instalación. Ejecución.
* Cargar la base de datos a raw
* Crear una versión limpia en cleaned
* Crear el esquema semantic
* Crear features temporales ligados a la entidad dadas las fechas del
evento. Guardarlos en el esquema features
