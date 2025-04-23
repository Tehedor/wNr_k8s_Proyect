#!/bin/bash
# ./volumenes.sh <nombre_del_volumen> <etcd_endpoint>

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

# Verificar si se proporcionó el argumento ETCD_ENDPOINT
if [ -z "$2" ]; then
  echo "Uso: $0 <nombre_del_volumen> <etcd_endpoint>"
  exit 1
fi

# Asignar el argumento a la variable ETCD_ENDPOINT
ETCD_ENDPOINT="$2"

# Capturar el estado del clúster usando etcdctl
echo "Capturando el estado del clúster..."
etcdctl --endpoints=$ETCD_ENDPOINT snapshot save cluster_snapshot.db

# Crear un directorio para los respaldos
BACKUP_DIR="cluster_backup"
mkdir -p $BACKUP_DIR

# Capturar ConfigMaps
echo "Respaldando ConfigMaps..."
kubectl get configmaps --all-namespaces -o yaml > $BACKUP_DIR/configmaps_backup.yaml

# Capturar Secrets
echo "Respaldando Secrets..."
kubectl get secrets --all-namespaces -o yaml > $BACKUP_DIR/secrets_backup.yaml

echo "Respaldo completado. Los archivos se han guardado en el directorio '$BACKUP_DIR'."