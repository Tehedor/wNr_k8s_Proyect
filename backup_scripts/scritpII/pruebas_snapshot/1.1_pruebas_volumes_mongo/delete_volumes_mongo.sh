# Quiero que me elimines:
# Deployent de monngo "mongo-deployment.yaml"
# PVC asociado al deployment de mongo "mongo-persistent-volume-claims.yaml"
# PV asociado al deployment de mongo "mongo-persistent-volume.yaml"
# Borrar directorio fisico de almacenamiento "mongo-persistent-volume.yaml"

# Quiero que me lo hagas en funcion de un argumento que es un número que definie el numero de reset: 0 todo, 1 hasta-pvc, 2 hasta-pv, 3 hasta-deployment
#!/bin/bash

# Verificar si se proporcionó el argumento RESET_LEVEL
if [ -z "$1" ]; then
  echo "Uso: $0 <nivel_de_reset>"
  echo "Niveles de reset: 0 (todo), 1 (hasta PVC), 2 (hasta PV), 3 (hasta Deployment)"
  exit 1
fi

# Asignar el argumento a la variable RESET_LEVEL
RESET_LEVEL="$1"

# Eliminar recursos en función del nivel de reset
case $RESET_LEVEL in
  3)
    echo "Eliminando el Deployment de MongoDB..."
    kubectl delete -f mongo-deployment.yaml
    ;&
  2)
    echo "Eliminando el PVC asociado al Deployment de MongoDB..."
    kubectl delete -f mongo-persistent-volume-claims.yaml
    rm -rf "/mnt/mongo"
    ;&
  1)
    echo "Eliminando el PV asociado al Deployment de MongoDB..."
    kubectl delete -f mongo-persistent-volume.yaml
    ;&
  0)
    echo "Borrando el directorio físico de almacenamiento..."
    rm -rf "/mnt/mongo"
    ;;
  *)
    echo "Nivel de reset no válido. Usa 0 (todo), 1 (hasta PVC), 2 (hasta PV), 3 (hasta Deployment)"
    exit 1
    ;;
esac

echo "Operación completada."