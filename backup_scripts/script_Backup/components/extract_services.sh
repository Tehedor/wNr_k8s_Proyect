#!/bin/bash
# extract_namespace(){
#     echo "Extracting namespaces"
#     kubectl get namespaces
# }

extract_namespace() {
    echo "Extracting namespaces"
    # Obtener los nombres de los namespaces y guardarlos en un array
    mapfile -t all_namespaces < <(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}')
}