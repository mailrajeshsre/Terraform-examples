variable "instancetype" {
  type = map(any)
  default = {
    "dev"  = "t2.nano",
    "test" = "t2.small",
    "prod" = "t2.micro"
  }
}

variable "image" {
  type    = list(any)
  default = ["ami-00952f27cf14db9cd", "ami-05a5bb48beb785bf1", "ami-03f4878755434977f"]
}

variable "input" {
  type = string
}