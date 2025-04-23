vsphere_user     = "user@vsphere.local"
vsphere_password = "your_password"
vsphere_server   = "your_vsphere_server"

# Vsphere
vsphere_datacenter      = "HOMELAB"
vsphere_compute_cluster = "BMCLU"
vsphere_resource_pool   = "NTT"
vsphere_datastore       = "BM-NVM-01-LOCAL"
vsphere_network         = "LAN"

# Template
vsphere_template_folder_name = "NTT"
vsphere_template_name        = "ubuntu-templatev2"

# VM
vm_firmware     = "efi"
vm_vcpu         = "4"
vm_memory       = "4096"
domain          = "lab.local"
vm_dns_servers  = ["8.8.8.8", "8.8.4.4"]
vm_ipv4_netmask = "24"
vm_ipv4_gateway = "172.16.1.1"
vm_disk_label   = "disk0"
vm_disk_size    = "30"
vm_disk_thin    = "true"

vms = {
  kMasterU = {
    name                = "ubuntu-templatev3"
    vm_ip               = "172.16.1.203"
  },
}