variable "vmws_reource_frontend_sourceid" {
  type        = string
  description = "(Required) The ID of the VM that to use for clone at the new"
}
variable "vmws_reource_frontend_denomination" {
  type        = string
  description = "(Required) The Name of VM in WS"
  default     = "NewInstance"
}
variable "vmws_reource_frontend_description" {
  type        = string
  description = "(Required) The Description at later maybe to explain the instance"
}
variable "vmws_frontend_path" {
  type        = string
  description = "(Required) The Path where will be our instance in VmWare"
}
variable "vmws_reource_frontend_processors" {
  type        = string
  description = "(Required) The number of processors of the Virtual Machine"
  default     = "1"
}
variable "vmws_reource_frontend_memory" {
  type        = string
  description = "(Required) The size of memory to the Virtual Machine"
  default     = "512"
}