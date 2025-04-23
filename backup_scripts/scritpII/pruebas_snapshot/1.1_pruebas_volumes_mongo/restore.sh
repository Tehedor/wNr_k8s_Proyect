#!/bin/bash

# Verificar si se proporcionó el argumento RESTORE_LEVEL
if [ -z "$1" ]; then
  echo "Uso: $0 <nivel_de_restauracion>"
  echo "Niveles de restauración: 0 (todo), 1 (hasta PVC), 2 (hasta PV), 3 (hasta Deployment)"
  exit 1
fi

# Asignar el argumento a la variable RESTORE_LEVEL
RESTORE_LEVEL="$1"

# Crear recursos en función del nivel de restauración
case $RESTORE_LEVEL in
  0)
    echo "Creando el directorio físico de almacenamiento..."
    mkdir -p "/mnt/mongo"
    ;&
  1)
    echo "Creando el PV asociado al Deployment de MongoDB..."
    kubectl apply -f mongo-persistent-volume.yaml
    ;&
  2)
    echo "Creando el PVC asociado al Deployment de MongoDB..."
    kubectl apply -f mongo-persistent-volume-claims.yaml
    ;&
  3)
    echo "Creando el Deployment de MongoDB..."
    kubectl apply -f mongo-deployment.yaml
    ;;
  *)
    echo "Nivel de restauración no válido. Usa 0 (todo), 1 (hasta PVC), 2 (hasta PV), 3 (hasta Deployment)"
    exit 1
    ;;
esac

echo "Operación completada."