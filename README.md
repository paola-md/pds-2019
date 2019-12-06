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

### Requerimientos
Para la instalación se requiere tener instalado Python3.

1. Clonar este repositorio 
```
$ git clone https://github.com/paola-md/pds-2019.git
```
2. ¿Cómo le hacemos para descargar los datos?


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
