resource "aws_instance" "server-1" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t2.micro"
  key_name      = "laptopkey"

  user_data = file("install_apache.sh")

  tags = {
    Name = "server-1"
  }
}