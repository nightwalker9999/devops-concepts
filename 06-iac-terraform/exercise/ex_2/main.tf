terraform {
  required_version = ">= 1.0"
}

provider "null" {}

resource "local_file" "example" {
    content = "Hello from Terraform file! And now I make some changes and store into a different file!"
    filename = "hello_from_terraform_with_changes.txt"
}
