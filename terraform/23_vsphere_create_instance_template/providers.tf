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
  }
  required_version = "~> 1.9"
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}