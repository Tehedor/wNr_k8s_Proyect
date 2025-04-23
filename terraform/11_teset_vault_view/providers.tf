terraform {
  required_providers {
 
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4"
    }
  }
  required_version = "~> 1.9"
}


provider "vault" {
  address = "http://172.16.1.201:8200" # Reemplaza con la dirección de tu servidor Vault
  token   = var.vault_token # Reemplaza con tu token de Vault
# export vault_token='pruebas123'
# export TF_VARS_vault_token='pruebas123'
}