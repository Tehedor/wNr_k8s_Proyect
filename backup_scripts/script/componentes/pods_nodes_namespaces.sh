#!/bin/bash

# Variables
NAMESPACE="<nombre_del_namespace>"
NODE_NAME="<nombre_del_nodo>"

# Obtener los pods de un namespace en un nodo
echo "Obteniendo los pods en el namespace '$NAMESPACE' en el nodo '$NODE_NAME'..."
PODS=$(kubectl get pods -n $NAMESPACE --field-selector spec.nodeName=$NODE_NAME -o jsonpath='{.items[*].metadata.name}')

# Verificar si se encontraron pods
if [ -z "$PODS" ]; then
    echo "No se encontraron pods en el nodo '$NODE_NAME' en el namespace '$NAMESPACE'."
    exit 1
fi

# Describir cada pod
echo "Describiendo los pods..."
for POD in $PODS; do
    echo "Describiendo pod: $POD"
    kubectl describe pod $POD -n $NAMESPACE
done