#!/bin/bash

for file in ./components/*.sh; do
  source "$file"
done

# 1.- Detectar todos los namespaces exitentes
extract_namespace # return: all_namespaces

for ns in "${all_namespaces[@]}"; do
    echo "Namespace: $ns"

    # 2.- Dividir Namespace por servicio
    extract_services $ns # return: all_services



done



    # 2.1.- Sacaremos de cada servicio todo los resource types que haya   


    # 2.2- Ver si hay volumne montado

        # Si hay volumen lo compimiremos en un tar.gz

    
    # 2.3- Filtraremos del file de config lo recursos necesarioa para el backup



    # 2.3- Exportar resultado de 2.2 y 2.3 al bucket de backup



# 