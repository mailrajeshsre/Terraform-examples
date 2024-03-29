terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.32.1"
    }
  }
  backend "s3" {
    bucket = "mycloudindia2024"
    key = "mycloud/ProjectA"
    region = "ap-south-1"
#    access_key = ""
#    secret_key = ""
    dynamodb_table = "rajesh"
  }
}

provider "aws" {
  region = "ap-south-1"
}