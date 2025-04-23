#!/bin/bash
# ./volumenes_restore.sh <etcd_endpoint> <nombre_del_volumen>

# Verificar si se proporcionó el argumento ETCD_ENDPOINT
if [ -z "$1" ]; then
  echo "Uso: $0 <etcd_endpoint>"
  exit 1
fi

# Asignar el argumento a la variable ETCD_ENDPOINT
ETCD_ENDPOINT="$1"

# Restaurar el estado del clúster usando etcdctl
echo "Restaurando el estado del clúster..."
etcdctl --endpoints=$ETCD_ENDPOINT snapshot restore cluster_snapshot.db

# Crear un directorio para los respaldos si no existe
BACKUP_DIR="cluster_backup"
if [ ! -d "$BACKUP_DIR" ]; then
  echo "El directorio de respaldo '$BACKUP_DIR' no existe. Asegúrate de que los respaldos estén en el directorio correcto."
  exit 1
fi

# Restaurar ConfigMaps
echo "Restaurando ConfigMaps..."
kubectl apply -f $BACKUP_DIR/configmaps_backup.yaml

# Restaurar Secrets
echo "Restaurando Secrets..."
kubectl apply -f $BACKUP_DIR/secrets_backup.yaml

# Verificar si se proporcionó el argumento VOLUME_NAME
if [ -z "$2" ]; then
  echo "Uso: $0 <etcd_endpoint> <nombre_del_volumen>"
  exit 1
fi

# Asignar el argumento a la variable VOLUME_NAME
VOLUME_NAME="$2"

# Restaurar el snapshot del volumen persistente
echo "Restaurando snapshot del volumen persistente '$VOLUME_NAME'..."
kubectl create -f - <<EOF
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: volumesnapshot-$VOLUME_NAME
spec:
  volumeSnapshotClassName: csi-hostpath-snapclass
  source:
    persistentVolumeClaimName: $VOLUME_NAME
EOF

echo "Restauración completada."