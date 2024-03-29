resource "aws_instance" "dev" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.small"
  tags = {
    Name = "Dev-Server"
  }
}

resource "aws_instance" "prod" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.small"
  tags = {
    Name = "Prod-Server"
  }
}
