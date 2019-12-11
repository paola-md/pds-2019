#!/bin/sh

# Cambiamos al usuario postgres y creamos credenciales
sudo su postgres 

# Creación de credenciales: usuario y contraseña
psql -c "CREATE USER moma2 with PASSWORD 'marmol';" 


# Creación de BD 
psql -c "CREATE DATABASE moma2 OWNER moma2;"
