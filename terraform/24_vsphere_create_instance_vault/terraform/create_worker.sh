#!/bin/bash

# variables
vms='{
  "kMasterU2": {
    "name": "kmasterU2",
    "vm_ip": "172.16.1.203"
  }
}'

type='worker'

export TF_VAR_vms="$vms"
export TF_VAR_type="$type"


export VAULT_ADDR='http://172.16.1.201:8200'
export VAULT_TOKEN='pruebas123'
name=$(echo "$vms" | grep -oP '"name":\s*"\K[^"]+')

# Cambiar al directorio 00_create_vm
cd "./00_create_vm" || {
  echo "Error: No se pudo cambiar al directorio 00_create_vm"
  exit 1
}

# Ejecutar terraform apply
# Variable de control
control_apply=true

if [ "$control_apply" = true ]; then
  terraform apply -auto-approve
else
  vault kv get -format=json -field=data secret/data/vm/$type/$name/terraform.tfstate > terraform.tfstate

  terraform destroy -auto-approve
  
  vault kv delete secret/data/vm/$type/$name/terraform.tfstate

  rm terraform.tfstate
  rm terraform.tfstate.backup

fi


# Verificar si terraform apply fue exitoso
if [ $? -eq 0 ]; then

  # terrafomr.tfstate
  if [ "$control_apply" = true ]; then
    export VAULT_ADDR='http://172.16.1.201:8200'
    export VAULT_TOKEN='pruebas123'
    name=$(echo "$vms" | grep -oP '"name":\s*"\K[^"]+')

    vault kv put secret/data/vm/$type/$name/terraform.tfstate @terraform.tfstate

    rm terraform.tfstate
    rm terraform.tfstate
    
    echo "Se ha guardado el estado de terraform en Vault."
  fi 
  
  echo "Terraform apply ejecutado con éxito."
else
  echo "Error: Terraform apply falló."
  exit 1
fi