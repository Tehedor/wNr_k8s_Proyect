
# Creación de las Máquinas Virtuales
resource "vsphere_virtual_machine" "vm" {
  for_each   = var.vms
  name       = each.value.name
  # resource_pool_id =  data.vsphere_compute_cluster.cluster.resource_pool_id 
  resource_pool_id = data.vsphere_resource_pool.custom_pool.id
  # resource_pool_id = var.vsphere_resource_pool 
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus         = var.vm_vcpu
  memory           = var.vm_memory
  # guest_id         = data.vsphere_virtual_machine.template.guest_id
  guest_id         = "ubuntu64Guest"
  firmware         = var.vm_firmware
  efi_secure_boot_enabled = false

  network_interface {
    network_id   = data.vsphere_network.network.id
    # adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    adapter_type = "vmxnet3"
  }

  disk {
    label            = var.vm_disk_label
    size             = var.vm_disk_size
    thin_provisioned = var.vm_disk_thin
  }

  #  vapp {
  #   properties = {
  #     "guestinfo.hostname"     = each.value.name
  #     "guestinfo.ipaddress"    = each.value.vm_ip
  #     "guestinfo.netmask"      = var.vm_ipv4_netmask
  #     "guestinfo.gateway"      = var.vm_ipv4_gateway
  #     "guestinfo.dns"          = join(",", var.vm_dns_servers)
  #     "guestinfo.domain"       = var.domain
  #     "guestinfo.password"     = "VMware1!",
  #     "guestinfo.ssh"          = "True"
  #   }
  # }

   cdrom {
    datastore_id = data.vsphere_datastore.iso_datastore.id
    path         = var.vsphere_iso_path
  }
  extra_config = {
    "efi.bootOrder.1" = "cdrom"
  }
  # provisioner "local-exec" {
  #   command = "echo 'Creando máquina virtual: ${each.value.name}'"
  # }

}