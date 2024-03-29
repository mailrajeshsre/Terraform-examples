locals {
  usa_tag = {
    Name = "USA-Project"
    Owner = "Rajesh"
  }
}

locals {
  uk_tag = {
    Name = "UK-Project"
    Owner = "Mahesh"
  }
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = local.usa_tag
}

resource "aws_vpc" "mynewvpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = local.usa_tag
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  size              = 10
  tags = local.usa_tag
}

resource "aws_instance" "myinstance-uk" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = local.uk_tag
}

resource "aws_vpc" "mynewvpc-uk" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  tags = local.uk_tag
}

resource "aws_ebs_volume" "example-uk" {
  availability_zone = "ap-south-1a"
  size              = 5
  tags = local.uk_tag
}