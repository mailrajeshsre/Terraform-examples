terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2560"
    "owner"          = "Rajesh Singh"
    "teams"          = "Devops"
    "environment"    = "development"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-05295b6e6c790593e"
  instance_type          = "t2.micro"
  key_name               = "laptopkey"
#  vpc_security_group_ids = ["sg-0519e747cec92a4b0"]
#  subnet_id              = "subnet-01c6efab488a38e9b"
  root_block_device {
    volume_size = "10"
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-bastion-host",var.tags["id"], var.tags["environment"])
    Rajesh  = "Terraform guy"
    },
  )
}

