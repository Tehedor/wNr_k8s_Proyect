#!/bin/bash

# Asignar el argumento a la variable VOLUME_NAME
VOLUME_NAME="mongo-pvc"

# Crear el directorio si no existe
SNAPSHOT_DIR=~/Documents/1_snapshotVolumes
mkdir -p $SNAPSHOT_DIR

# Crear el archivo YAML del snapshot en el directorio especificado
SNAPSHOT_FILE="$SNAPSHOT_DIR/volumesnapshot-$VOLUME_NAME.yaml"

# Generar el contenido del archivo YAML
cat <<EOF > $SNAPSHOT_FILE
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: volumesnapshot-$VOLUME_NAME
spec:
  volumeSnapshotClassName: csi-hostpath-snapclass
  source:
    persistentVolumeClaimName: $VOLUME_NAME
EOF

# Aplicar el archivo YAML para crear el snapshot
echo "Creando snapshot del volumen persistente '$VOLUME_NAME'..."
kubectl apply -f $SNAPSHOT_FILE

echo "Snapshot creado y guardado en: $SNAPSHOT_FILE"

