
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

# variable "vsphere_template_folder_name" {
#   description = "Nombre de la carpeta donde se encuentra la template"
#   type        = string
# }

# variable "vsphere_template_name" {
#   description = "Nombre de la template"
#   type        = string
# }

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template_name
  folder        = var.vsphere_template_folder_name
  datacenter_id = data.vsphere_datacenter.dc01.id
}
