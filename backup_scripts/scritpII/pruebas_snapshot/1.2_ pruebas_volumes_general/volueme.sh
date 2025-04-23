#!/bin/bash
# ./volumenes.sh <nombre_del_volumen> 

# Verificar si se proporcionó el argumento VOLUME_NAME
if [ -z "$1" ]; then
  echo "Uso: $0 <nombre_del_volumen>"
  exit 1
fi

# Asignar el argumento a la variable VOLUME_NAME
VOLUME_NAME="$1"

# Crear un snapshot del volumen persistente
echo "Creando snapshot del volumen persistente '$VOLUME_NAME'..."
kubectl create volumesnapshot volumesnapshot-$VOLUME_NAME --volume-snapshot-class=csi-hostpath-snapclass --source-pvc=$VOLUME_NAME
