resource "aws_instance" "ec2-server" {
  ami                    = "ami-05295b6e6c790593e"
  instance_type          = element(var.instance_types, 0)
  key_name               = "laptopkey"
  vpc_security_group_ids = ["sg-0519e747cec92a4b0"]
  subnet_id              = element(var.subnet_id, 0)
  availability_zone      = element(var.availability_zones, 2)

  root_block_device {
    volume_size = "10"
  }

  tags = {
    Name      = "ec2-server"
  }
}