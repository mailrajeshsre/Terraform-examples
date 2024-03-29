variable "record" {
  type    = string
  default = "artifactory.rajesh.devops.com:5432"
}

output "split" {
  value = split(":", var.record)
}

output "record_split" {
  value = (split(":", var.record)[0])
}

output "record_split1" {
  value = (split(":", var.record)[1])
}
