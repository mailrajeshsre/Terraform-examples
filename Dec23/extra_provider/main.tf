resource "aws_instance" "mumbai-ec2" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = {
    Name = "mumbai-ec2"
    Env = "Dev"
  }
}

resource "aws_instance" "singapore-ec2" {
  ami           = "ami-0e5d58de654dfb50d"
  instance_type = "t2.micro"
  provider = aws.singapore
  tags = {
    Name = "singapore-ec2"
    Env = "Prod"
  }
}

