#!/bin/bash

# Verificar si se proporcionó el argumento NODE_NAME
if [ -z "$1" ]; then
  echo "Uso: $0 <nombre_del_nodo>"
  exit 1
fi

# Asignar el argumento a la variable NODE_NAME
NODE_NAME="$1"

# Obtener el namespace si se proporciona como segundo argumento (opcional)
NAMESPACE="${2:-default}"

# Crear el directorio control_nodes si no existe
DIRECTORY="control_nodes"
mkdir -p $DIRECTORY

# Función para generar el nombre del archivo JSON
generate_filename() {
  local pod_name="$1"
  local timestamp=$(date +%Y-%m-%d-%H%M%S)
  echo "${DIRECTORY}/${NODE_NAME}_${NAMESPACE}_${pod_name}_${timestamp}.json"
}

# Obtener los pods en un nodo
echo "Obteniendo los pods en el nodo '$NODE_NAME' en el namespace '$NAMESPACE'..."
PODS=$(kubectl get pods -n $NAMESPACE --field-selector spec.nodeName=$NODE_NAME -o jsonpath='{.items[*].metadata.name}')

# Verificar si se encontraron pods
if [ -z "$PODS" ]; then
  echo "No se encontraron pods en el nodo '$NODE_NAME' en el namespace '$NAMESPACE'."
  exit 1
fi

# Describir cada pod y generar el JSON
echo "Describiendo los pods y generando archivos JSON..."
for POD in $PODS; do
  # Obtener la descripción del pod en formato JSON
  POD_DESCRIPTION=$(kubectl get pod $POD -n $NAMESPACE -o json)

  # Generar el nombre del archivo
  FILENAME=$(generate_filename "$POD")

  # Escribir el JSON en el archivo
  echo "$POD_DESCRIPTION" | jq . > "$FILENAME"
  echo "Se ha creado el archivo: $FILENAME"
done