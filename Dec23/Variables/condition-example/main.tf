resource "aws_instance" "dev" {
  instance_type = var.instancetype["dev"]
  ami           = var.image[0]
  count         = var.input == "dev" ? 1 : 0
  tags = {
    Name = "Dev-Department"
  }
}

resource "aws_instance" "test" {
  instance_type = var.instancetype["test"]
  ami           = var.image[1]
  count         = var.input == "test" ? 2 : 0
  tags = {
    Name = "Test-Department"
  }
}

resource "aws_instance" "prod" {
  instance_type = var.instancetype["prod"]
  ami           = var.image[2]
  count         = var.input == "prod" ? 3 : 0
  tags = {
    Name = "Prod-Department"
  }
}