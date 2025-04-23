variable "vault_token" {
  description = "Token for Vault authentication"
  type        = string
  sensitive = true
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
}

variable "instance_pass" {
  description = "Password of the instance"
  type        = string
}

