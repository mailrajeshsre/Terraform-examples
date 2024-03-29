resource "aws_instance" "myinstance" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = {
    Name = "myserver"
  }
}


