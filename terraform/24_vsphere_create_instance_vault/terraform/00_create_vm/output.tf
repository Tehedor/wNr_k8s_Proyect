output "datastore_id" {
  value       = data.vsphere_datastore.datastore.id
  description = "ID del datastore principal"
}

output "cloudinit_config" {
  description = "Configuración renderizada de cloud-init para cada máquina virtual"
  value = {
    for vm_key, config in data.template_cloudinit_config.example :
    vm_key => config.rendered
  }
}