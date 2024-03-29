# Creating VPC, CIDR and tags
resource "aws_vpc" "Blue-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Blue-vpc"
  }
}

#Creating Public Subnets in Blue-vpc

resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.Blue-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "dev-public-1"
  }
}

resource "aws_subnet" "dev-public-2" {
  vpc_id                  = aws_vpc.Blue-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "dev-public-2"
  }
}

#Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.Blue-vpc.id

  tags = {
    Name = "dev-gw"
  }
}

#Creating Route Tables for Internet Gateway

resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.Blue-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }
  tags = {
    Name = "dev-public-1"
  }
}

#Creating EC2 instances in Public Subnets
resource "aws_instance" "Server1" {
  ami           = "ami-0a0f1259dd1c90938"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dev-public-1.id
  key_name      = "laptopkey"
  tags = {
    Name = "Server1"
  }
}

resource "aws_instance" "Server2" {
  ami           = "ami-0a0f1259dd1c90938"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dev-public-2.id
  key_name      = "laptopkey"
  tags = {
    Name = "Server2"
  }
}
