variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}

variable "subnet_id" {
  type = list(string)
  default = [
    "subnet-01c6efab488a38e9b",
    "subnet-0e4a71c3a6099cfcc",
    "subnet-00f278aae858c0cf5"
  ]
}