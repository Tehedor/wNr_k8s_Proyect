resource "local_file" "credentials_file" {

  filename = "${path.module}/credentials.txt"
  content = <<EOT
Instance Name: ${var.instance_name}
Instance pass: ${var.instance_pass}
EOT
}