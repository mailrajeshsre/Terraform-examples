variable "instance_tag" {
  type    = list(string)
  default = ["Dev-Dept", "Test-Dept", "Prod-Dept"]
}

variable "instance_type" {
  type    = list(string)
  default = ["t2.nano", "t2.small", "t2.micro"]
}