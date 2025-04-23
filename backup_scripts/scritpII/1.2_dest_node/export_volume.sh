#!/bin/bash

# Asignar el nombre del PVC
VOLUME_NAME="mongo-pvc"

# Crear el directorio si no existe
EXPORT_DIR=~/Documents/export/mongo
mkdir -p $EXPORT_DIR

# Definir las rutas
SOURCE_DIR="/mnt/mongo"
TAR_FILE="$EXPORT_DIR/mongo_volume_backup.tar.gz"

# Verificar si el directorio de origen existe
if [ ! -d "$SOURCE_DIR" ]; then
  echo "El directorio de origen $SOURCE_DIR no existe."
  exit 1
fi

# Crear un archivo tar del directorio de origen
sudo tar -czvf $TAR_FILE -C $SOURCE_DIR .

echo "Exportación completada. Archivo guardado en: $TAR_FILE"
