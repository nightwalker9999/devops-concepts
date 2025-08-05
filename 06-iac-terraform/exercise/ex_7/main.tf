terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}


variable "rules" {
    type = list(object({
        from_port = number
        to_port = number
        cidr_blocks = list(string)
    }))

    default = [
        {from_port = 22, to_port = 22, cidr_blocks = ["0.0.0.0/0"]},
        {from_port = 80, to_port = 80, cidr_blocks = ["0.0.0.0/0"]}
    ]
}

resource "aws_security_group" "web" {
  name        = "web_sg"
  description = "Security group for web"
  vpc_id      = "vpc-4f2b8cdf273cf19d5" # ← from AWS CLI output

  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}
