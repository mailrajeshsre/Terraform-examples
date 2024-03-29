# Terraform setting
terraform {
  required_version = "~>1.7.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
