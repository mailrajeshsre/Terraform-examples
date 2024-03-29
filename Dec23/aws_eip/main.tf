resource "aws_instance" "server-1" {
  ami           = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"

  tags = {
    Name = "my-server-1"
  }
}

resource "aws_eip" "myeip" {
  instance = aws_instance.server-1.id
  domain   = "vpc"
}