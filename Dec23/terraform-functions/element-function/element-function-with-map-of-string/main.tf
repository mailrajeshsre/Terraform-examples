resource "aws_instance" "ec2-server" {
  ami           = element([var.vm["ami"]], 0)
  instance_type = element([var.vm["instance_types"]], 0)
  key_name      = element([var.vm["key_name"]], 0)
  vpc_security_group_ids = [
    element([var.vm["vpc_security_group_ids"]], 0)
  ]
  subnet_id         = element([var.vm["subnet_id"]], 0)
  availability_zone = element([var.vm["availability_zones"]], 0)

  root_block_device {
    volume_size = element([var.vm["volume_size"]], 0)
  }

  tags = {
    Name      = "ec2-server"
  }
}


