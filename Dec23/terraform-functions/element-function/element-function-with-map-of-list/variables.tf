variable "vm" {
  type = map(list(string))
  default = {
    region                 = ["ap-south-1"]
    availability_zones     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
    instance_types         = ["t2.micro", "t2.small", "t2.medium"]
    subnet_id              = ["subnet-01c6efab488a38e9b"]
    ami                    = ["ami-05295b6e6c790593e"]
    vpc_security_group_ids = ["sg-0519e747cec92a4b0", "sg-0327b0fa9c6f1f410"]
    key_name               = ["laptopkey"]
    volume_size            = ["10"]
  }
}