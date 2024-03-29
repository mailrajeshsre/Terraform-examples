resource "aws_instance" "prod" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.micro"
  tags = {
    Name = "Prod-Server"
  }

provisioner "local-exec" {
  command = "echo Hello from local-exec provisioner" 
  when = destroy
 }
}