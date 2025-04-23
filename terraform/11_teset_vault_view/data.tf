data "vault_generic_secret" "instance_screts" {
  path = "secret/myapp/database"
}