FROM ubuntu:latest

# Actualizamos las dependencias e instalamos sshpass
RUN apt-get update && apt-get install -y sshpass

# Agregamos el script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Establecer el script de entrada
ENTRYPOINT ["/entrypoint.sh"]