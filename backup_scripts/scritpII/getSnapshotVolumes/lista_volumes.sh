#!/bin/bash

# Entrada
# ./listar_volumenes.sh <nombre-del-nodo>

# Salida
# Obteniendo pods en el nodo: nodo-ejemplo...
# Obteniendo snapshots de volúmenes...
# Pod: default/nginx-7d8dbbbf78-4vjtm
#   - PVC: nginx-pvc
#     -> Snapshot: default/nginx-snapshot
# Pod: kube-system/coredns-74ff55c5b-5k6zm
#   - PVC: coredns-pvc


# Verifica que el usuario ha proporcionado el nombre del nodo
if [ -z "$1" ]; then
  echo "Uso: $0 <nombre-del-nodo>"
  exit 1
fi

NODE_NAME="$1"

# Obtiene todos los pods que están en el nodo
echo "Obteniendo pods en el nodo: $NODE_NAME..."
PODS_JSON=$(kubectl get pods --all-namespaces -o json --field-selector spec.nodeName="$NODE_NAME")

# Verifica si se encontraron pods
if [ "$(echo "$PODS_JSON" | jq '.items | length')" -eq 0 ]; then
  echo "No se encontraron pods en el nodo: $NODE_NAME"
  exit 0
fi

# Obtiene los snapshots del clúster
echo "Obteniendo snapshots de volúmenes..."
SNAPSHOTS_JSON=$(kubectl get volumesnapshots --all-namespaces -o json)
declare -A SNAPSHOT_MAP

# Construye un mapa de PVC a snapshots
echo "$SNAPSHOTS_JSON" | jq -c '.items[] | {namespace: .metadata.namespace, name: .metadata.name, pvc: .spec.source.persistentVolumeClaimName}' | while read -r snapshot; do
  PVC_NAME=$(echo "$snapshot" | jq -r '.pvc')
  SNAPSHOT_MAP["$PVC_NAME"]=$(echo "$snapshot" | jq -r '.namespace + "/" + .name')
done

# Itera sobre los pods en el nodo
echo "$PODS_JSON" | jq -c '.items[]' | while read -r pod; do
  POD_NAME=$(echo "$pod" | jq -r '.metadata.name')
  POD_NAMESPACE=$(echo "$pod" | jq -r '.metadata.namespace')
  echo "Pod: $POD_NAMESPACE/$POD_NAME"

  # Extrae los PVC montados en el pod
  echo "$pod" | jq -c '.spec.volumes[] | select(.persistentVolumeClaim != null) | .persistentVolumeClaim.claimName' | while read -r pvc; do
    PVC_NAME=$(echo "$pvc" | tr -d '"')
    echo "  - PVC: $PVC_NAME"

    # Verifica si hay un snapshot asociado al PVC
    if [[ -n "${SNAPSHOT_MAP[$PVC_NAME]}" ]]; then
      echo "    -> Snapshot: ${SNAPSHOT_MAP[$PVC_NAME]}"
    fi
  done
done
