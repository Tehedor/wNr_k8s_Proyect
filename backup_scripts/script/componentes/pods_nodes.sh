#!/bin/bash

# Verificar si se proporcionó el argumento NODE_NAME
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_nodo>"
    exit 1
fi

# Asignar el argumento a la variable NODE_NAME
NODE_NAME="$1"

# Obtener los pods en un nodo
echo "Obteniendo los pods en el nodo '$NODE_NAME'..."
PODS=$(kubectl get pods --field-selector spec.nodeName=$NODE_NAME -o jsonpath='{.items[*].metadata.name}')

# Verificar si se encontraron pods
if [ -z "$PODS" ]; then
    echo "No se encontraron pods en el nodo '$NODE_NAME'."
    exit 1
fi

# Describir cada pod
echo "Describiendo los pods..."
for POD in $PODS; do
    echo "Describiendo pod: $POD"
    kubectl describe pod $POD 
done


