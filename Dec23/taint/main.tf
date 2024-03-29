resource "aws_instance" "taint_example_one" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.micro"
  tags = {
    Name = "taint_ec2_one"
  }
}


resource "aws_instance" "taint_example_two" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.micro"
  tags = {
    Name = "taint_ec2_two"
  }
}