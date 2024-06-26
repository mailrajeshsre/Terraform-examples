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

variable "ec2_instance_config" {
  type        = any
  description = "Configuration for EC2 instance"
  default = {
    ec2_settings = {
      ami           = "ami-05295b6e6c790593e"
      instance_type = ["t2.micro", "t2.medium"]
      key_name      = "terraform-aws"
    }
    vpc_settings = {
      vpc_cidr_block       = "10.10.0.0/16"
      enable_dns_support   = true
      enable_dns_hostnames = true
      availability_zones   = ["ap-south-1a", "ap-south-1b"]
      subnet_cidr_blocks   = ["10.10.1.0/24", "10.10.2.0/24"]
    }
    tags = {
      "id"             = "2560"
      "owner"          = "Rajesh Singh"
      "teams"          = "Devops"
      "environment"    = "development"
      "project"        = "del"
      "create_by"      = "Terraform"
      "cloud_provider" = "aws"
    }
  }
}

resource "aws_vpc" "example_vpc" {
  cidr_block           = var.ec2_instance_config["vpc_settings"]["vpc_cidr_block"]
  enable_dns_support   = var.ec2_instance_config["vpc_settings"]["enable_dns_support"]
  enable_dns_hostnames = var.ec2_instance_config["vpc_settings"]["enable_dns_hostnames"]
  tags = merge(var.ec2_instance_config["tags"], {
    Name = format("%s-%s-%s-vpc", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
    },
  )
}

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
  tags = merge(var.ec2_instance_config["tags"], {
    Name = format("%s-%s-%s-internet-gateway", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
    },
  )
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = var.ec2_instance_config["vpc_settings"]["subnet_cidr_blocks"][0]
  availability_zone       = var.ec2_instance_config["vpc_settings"]["availability_zones"][0]
  map_public_ip_on_launch = true
  tags = merge(var.ec2_instance_config["tags"], {
    Name = format("%s-%s-%s-public-subnet", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
    },
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
  tags = merge(var.ec2_instance_config["tags"], {
    Name = format("%s-%s-%s-public-subnet-route-table", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
    },
  )
}

resource "aws_route_table_association" "public_01" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "example_sg" {
  name        = format("%s-%s-%s-sg", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
  description = "Example security group for EC2 instance"
  vpc_id      = aws_vpc.example_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami                    = var.ec2_instance_config["ec2_settings"]["ami"]
  instance_type          = var.ec2_instance_config["ec2_settings"]["instance_type"][0]
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = var.ec2_instance_config["ec2_settings"]["key_name"]
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  tags = merge(var.ec2_instance_config["tags"], {
    Name = format("%s-%s-%s-vm", var.ec2_instance_config["tags"]["id"], var.ec2_instance_config["tags"]["environment"], var.ec2_instance_config["tags"]["project"])
    },
  )
}
