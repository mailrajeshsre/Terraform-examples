
resource "aws_instance" "firstvm" {
  ami           = var.image_id
  instance_type = var.ec2_instance_type
  tags = {
    Name = "Server-1"
  }
}

resource "aws_instance" "secondvm" {
  ami           = var.image_id
  instance_type = var.ec2_instance_type
  tags = {
    Name = "Server-2"
  }
}