variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Specify the instance type to be used"

  validation {
    condition     = can(regex("^[Tt][2-3].(nano|micro|small)", var.ec2_instance_type))
    error_message = "Invalid Instance Type Name. You can choose - t2.nano,t2.micro,t2.small"
  }
}

variable "image_id" {
  type        = string
  default     = "ami-0d980397a6e8935cd"
  description = "Specify the AMI being used"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id must be valid AMI is, starting with \"ami-\","
  }
}