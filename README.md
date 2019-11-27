# Proyecto: Set de datos de Comisión de Sentencias Individuales de los Estados Unidos 
(United States Sentencing Commission Individual Offender Data Sets) 

## Descripción de Entidad
No sé que sea esto

## Estrucura de la base de datos

## Instalación
Tal vez hacer un contenedor de Docker
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
