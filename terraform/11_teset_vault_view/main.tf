resource "local_file" "credentials_file" {

  filename = "${path.module}/credentials.txt"
  content = <<EOT
Instance Name: ${data.vault_generic_secret.instance_screts.data["instance_name"]}
Instance Pass: ${data.vault_generic_secret.instance_screts.data["instance_pass"]}
EOT
}