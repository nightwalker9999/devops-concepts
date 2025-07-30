terraform {
  required_version = ">= 1.0"
}

provider "null" {}

resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo Hello, Terraform!"
  }
}
