# Create a new load balancer
resource "aws_elb" "myelb" {
  name               = var.elbname
  availability_zones = var.azname

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = var.elbname
  }
}

resource "aws_instance" "Dev" {
  instance_type = var.ec2_instance_type[0]
  ami           = var.image_id[0]
  tags = {
    Name = var.instance_tag[0]
  }
}

resource "aws_instance" "Test" {
  instance_type = var.ec2_instance_type[1]
  ami           = var.image_id[1]
  tags = {
    Name = var.instance_tag[1]
  }
}

resource "aws_instance" "Prod" {
  instance_type = var.ec2_instance_type[2]
  ami           = var.image_id[2]
  tags = {
    Name = var.instance_tag[2]
  }
}