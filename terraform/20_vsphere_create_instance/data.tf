
data "vsphere_datacenter" "dc01" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc01.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc01.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc01.id
}


data "vsphere_resource_pool" "custom_pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc01.id
}

# data "vsphere_virtual_machine" "template" {
#   name          = var.vm_template_name
#   datacenter_id = data.vsphere_datacenter.dc01.id
# }

# Controlador de la ISO
data "vsphere_datastore" "iso_datastore" {
  name          = var.vsphere_iso_datastore
  datacenter_id = data.vsphere_datacenter.dc01.id
}

