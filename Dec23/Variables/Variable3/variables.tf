variable "elbname" {
  type = string
}

variable "azname" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "timeout" {
  type = number
}

variable "ec2_instance_type" {
  type = map(any)
  default = {
    "dev"  = "t2.nano"
    "test" = "t2.small"
    "prod" = "t2.micro"
  }
}

variable "image_id" {
  type    = list(string)
  default = ["ami-00952f27cf14db9cd", "ami-03f4878755434977f", "ami-04708942c263d8190"]
}

variable "instance_tag" {
  type    = list(string)
  default = ["Dev-Dept", "Test-Dept", "Prod-Dept"]
}