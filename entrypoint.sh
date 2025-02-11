#!/bin/bash

# Variables de entrada
PASSWORD=$1
USER=$2
HOST=$3
PORT=$4
COMMANDS=$5

# Realizamos la conexión SSH y ejecutamos los comandos
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no -o LogLevel=quiet -p "$PORT" "$USER@$HOST" << EOF
  $COMMANDS
EOF