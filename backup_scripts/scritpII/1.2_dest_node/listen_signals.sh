#!/bin/bash
# echo "Ejecutar script" | nc <IP_DEL_SERVIDOR> 12345

# Puerto en el que el servidor escuchará las señales
PORT=12345

# Ruta al script que se ejecutará
SCRIPT_PATH=./export_volume.sh

# Función para manejar la señal y ejecutar el script
handle_signal() {
  echo "Señal recibida. Ejecutando el script..."
  sudo bash $SCRIPT_PATH
  echo "Script ejecutado correctamente."
}

# Escuchar en el puerto especificado y manejar la señal
while true; do
  echo "Esperando señales en el puerto $PORT..."
  # Escuchar en el puerto y leer la entrada
  nc -l -p $PORT | while read line; do
    handle_signal
    echo "Señal procesada" | nc -q 1 $line 12345
  done
done