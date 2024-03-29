resource "aws_instance" "ec2_example" {
  ami           = "ami-00952f27cf14db9cd"
  instance_type = "t2.micro"
  count         = 1
  tags = {
    Name = "Terraform_EC2_server"
  }
}

resource "aws_iam_user" "myiamuser" {
  for_each = var.user_names
  name     = each.value

}