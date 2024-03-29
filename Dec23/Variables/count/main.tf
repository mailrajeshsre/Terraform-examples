
resource "aws_instance" "Dev" {
  instance_type = var.instance_type[count.index]
  ami           = "ami-00952f27cf14db9cd"
  count         = 3
  tags = {
    Name = var.instance_tag[count.index]
  }
}

