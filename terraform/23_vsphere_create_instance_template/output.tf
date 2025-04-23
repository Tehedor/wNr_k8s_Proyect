output "datastore_id" {
  value = data.vsphere_datastore.datastore.id
  description = "ID del datastore principal"
}