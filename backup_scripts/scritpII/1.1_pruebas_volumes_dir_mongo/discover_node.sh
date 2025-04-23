#!/bin/bash

# Asignar el nombre del PVC
VOLUME_NAME="mongo-pvc"

# Crear el directorio si no existe
EXPORT_DIR=~/Documents/1_snapshotVolumes/export
mkdir -p $EXPORT_DIR

# Obtener el nombre del pod de MongoDB y su namespace
MONGO_POD=$(kubectl get pods --all-namespaces -o jsonpath='{.items[?(@.metadata.labels.app=="mongo")].metadata.name}')
MONGO_NAMESPACE=$(kubectl get pods --all-namespaces -o jsonpath='{.items[?(@.metadata.labels.app=="mongo")].metadata.namespace}')

# Verificar si se encontró el pod de MongoDB
if [ -z "$MONGO_POD" ]; then
    echo "No se encontró ningún pod de MongoDB."
    exit 1
fi

# Obtener el nodo en el que está montado el pod de MongoDB
MONGO_NODE=$(kubectl get pod $MONGO_POD -n $MONGO_NAMESPACE -o jsonpath='{.spec.nodeName}')

# Verificar si se encontró el nodo
if [ -z "$MONGO_NODE" ]; then
    echo "No se encontró el nodo en el que está montado el pod de MongoDB."
    exit 1
fi

# Mostrar el nodo en el que está montado el pod de MongoDB
echo "El pod de MongoDB '$MONGO_POD' está montado en el nodo '$MONGO_NODE'."
