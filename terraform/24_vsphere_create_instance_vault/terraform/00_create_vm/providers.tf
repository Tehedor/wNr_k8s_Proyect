terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.9" # La notación "~>" significa que cualquier versión compatible con 2.9 es válida.
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
  }
  required_version = "~> 1.9"
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

provider "vault" {
  address = "http://172.16.1.201:8200" # Reemplaza con la dirección de tu servidor Vault
  token   = "pruebas123"               # Reemplaza con tu token de Vault
}
