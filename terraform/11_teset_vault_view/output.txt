output "iso_datastore_id" {
  value = data.vsphere_datastore.iso_datastore.id
  description = "ID del datastore donde se encuentra la ISO"
}

output "datastore_id" {
  value = data.vsphere_datastore.datastore.id
  description = "ID del datastore principal"
}