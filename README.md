# Proyecto: Set de datos de "The Museum of Modern Art" (MoMa) 
Disponible [aquí](https://github.com/MuseumofModernArt/collection)
[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.3524700.svg)](http://dx.doi.org/10.5281/zenodo.3524700)

## Descripción de Entidad
Nuestra entidad son los artistas blah blah blah

## Estrucura de la base de datos
La base de datos consta de dos tablas: Artists y Artworks.
Se pueden unir através de la variable ConsituentID que es único para los artistas y múltiple para las obras de arte.

## Instalación
A través de Vagrant se puede ejecutar el proyecto. 
Vagrant se debe descargar [aquí](https://www.vagrantup.com/downloads.html)
Archivos disponibles [aquí](https://github.com/ITAM-DS/programming-for-data-science-2019/tree/master/vagrant-ds)

### Requerimientos
Para la instalación se requiere tener instalado Python3.

1. Clonar este repositorio 
```
$ git clone https://github.com/paola-md/pds-2019.git
```
2. Dentro del repositorio, ejecutar los dos scripts de shell. El primero descarga los datos y el segundo extrae los datos y los convierte a formato csv. 
```
$ ./getdata.sh
$ ./ExtractData.sh
```


## Ejecución



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
