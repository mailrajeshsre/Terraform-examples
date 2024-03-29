resource "aws_instance" "ec2_example" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-EC2"
  }
}

resource "null_resource" "null_resource_simple" {
    triggers = {
      id = timestamp()
    }
   
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}