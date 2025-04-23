resource "random_password" "vm_password" {
  for_each = var.vms

  length           = 8
  special          = true
  override_special = "_%@"
}

resource "vault_generic_secret" "vm_credentials" {
  for_each = var.vms

  path = "secret/data/vm/${var.type}/${each.value.name}"

  data_json = jsonencode({
    username = "admin" # Cambia esto si necesitas un nombre de usuario dinámico
    password = random_password.vm_password[each.key].result
  })
}

data "template_cloudinit_config" "example" {
  for_each = var.vms 
  gzip = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = <<-EOF
      #cloud-config
      # hostname: kmasteru1
      hostname: ${each.value.name}
      network:
        version: 2 
        ethernets:
          eth0:
            dhcp4: no
            addresses: [${each.value.vm_ip}/${var.vm_ipv4_netmask}]
            gateway4: ${var.vm_ipv4_gateway}
            nameservers:
              addresses: ${jsonencode(var.vm_dns_servers)}
      users:
        - name: develop
          # passwd: hola1234
          # passwd: ${random_password.vm_password[each.key].result}
          lock_passwd: false
      runcmd:
        # - echo "develop:hola123" | chpasswd 
        - echo "develop:${random_password.vm_password[each.key].result}" | chpasswd
        # - systemctl restart sshd
        - systemctl restart systemd-networkd  # [[3]]
  EOF
  }
}

        # - echo "develop:${random_password.vm_password[each.key].result}" | chpasswd -e
        # - echo "develop:hola123" | chpasswd -e

resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = each.value.name
  folder           = data.vsphere_virtual_machine.template.folder
  resource_pool_id = data.vsphere_resource_pool.custom_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus                = var.vm_vcpu
  memory                  = var.vm_memory
  guest_id                = data.vsphere_virtual_machine.template.guest_id
  firmware                = data.vsphere_virtual_machine.template.firmware
  efi_secure_boot_enabled = false

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]

  }

  disk {
    label            = var.vm_disk_label
    size             = var.vm_disk_size
    thin_provisioned = var.vm_disk_thin
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

  #   customize {
  #     linux_options {
  #       host_name = each.value.name
  #       domain    = var.domain
  #     }

  #     network_interface {
  #       ipv4_address    = each.value.vm_ip
  #       ipv4_netmask    = var.vm_ipv4_netmask
  #       dns_server_list = var.vm_dns_servers
  #     }

  #     ipv4_gateway = var.vm_ipv4_gateway

  #   }
  }
  extra_config = {
    "guestinfo.userdata"          = data.template_cloudinit_config.example[each.key].rendered
    "guestinfo.userdata.encoding" = "gzip+base64"
  }
}