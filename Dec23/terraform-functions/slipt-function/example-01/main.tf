variable "comma_separated_list" {
  type    = string
  default = "apple,banana,cherry"
}

locals {
  fruits = split(",", var.comma_separated_list)
}

output "fruits_list" {
  value = local.fruits
}
