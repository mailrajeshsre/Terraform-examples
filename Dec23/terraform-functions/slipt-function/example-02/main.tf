variable "space_delimited_string" {
  type    = string
  default = "Alice Bob Charlie David Eve"
}

locals {
  names = split(" ", var.space_delimited_string)
}

output "names_list" {
  value = local.names
}


