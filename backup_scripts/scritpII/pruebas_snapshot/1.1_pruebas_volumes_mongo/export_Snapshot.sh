#!/bin/bash

# Asignar el nombre del PVC
VOLUME_NAME="mongo-pvc"

# Crear el directorio si no existe
EXPORT_DIR=~/Documents/1_snapshotVolumes/export
mkdir -p $EXPORT_DIR

# Exportar el VolumeSnapshot
SNAPSHOT_NAME="volumesnapshot-$VOLUME_NAME"
kubectl get volumesnapshot $SNAPSHOT_NAME -o yaml > $EXPORT_DIR/$SNAPSHOT_NAME.yaml

# Exportar el PVC
kubectl get pvc $VOLUME_NAME -o yaml > $EXPORT_DIR/$VOLUME_NAME.yaml

# Exportar el PV asociado al PVC
PV_NAME=$(kubectl get pvc $VOLUME_NAME -o jsonpath='{.spec.volumeName}')
kubectl get pv $PV_NAME -o yaml > $EXPORT_DIR/$PV_NAME.yaml

echo "Exportación completada. Archivos guardados en: $EXPORT_DIR"

# bash ./delete_volumes_mongo.sh 