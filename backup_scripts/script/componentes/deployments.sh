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
DIRECTORY="deployments/${NODE_NAME}_deployments"
mkdir -p $DIRECTORY

# Función para generar el nombre del archivo JSON
generate_filename() {
  local deployment_name="$1"
  local timestamp=$(date +%Y-%m-%d-%H%M%S)
  echo "${DIRECTORY}/${NODE_NAME}_${NAMESPACE}_${deployment_name}_${timestamp}.json"
}

# Obtener los deployments en un nodo
echo "Obteniendo los deployments en el nodo '$NODE_NAME' en el namespace '$NAMESPACE'..."
DEPLOYMENTS=$(kubectl get deployments -n $NAMESPACE -o jsonpath='{.items[*].metadata.name}')

# Verificar si se encontraron deployments
if [ -z "$DEPLOYMENTS" ]; then
  echo "No se encontraron deployments en el nodo '$NODE_NAME' en el namespace '$NAMESPACE'."
  exit 1
fi

# Describir cada deployment y generar el JSON
echo "Describiendo los deployments y generando archivos JSON..."
for DEPLOYMENT in $DEPLOYMENTS; do
  # Obtener la descripción del deployment en formato JSON
  DEPLOYMENT_DESCRIPTION=$(kubectl get deployment $DEPLOYMENT -n $NAMESPACE -o json)

  # Generar el nombre del archivo
  FILENAME=$(generate_filename "$DEPLOYMENT")

  # Escribir el JSON en el archivo
  echo "$DEPLOYMENT_DESCRIPTION" | jq . > "$FILENAME"
  echo "Se ha creado el archivo: $FILENAME"
done