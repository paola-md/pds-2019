#!/bin/sh

# Creación de credenciales: usuario y contraseña
sudo -i -u postgres psql -c "CREATE USER moma2 with PASSWORD 'marmol';" 

# Creación de BD 
sudo -i -u postgres psql -c "CREATE DATABASE moma2 OWNER moma2;"
