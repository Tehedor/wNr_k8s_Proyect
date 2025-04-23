# Asignar el argumento a la variable VOLUME_NAME
VOLUME_NAME="$1"

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