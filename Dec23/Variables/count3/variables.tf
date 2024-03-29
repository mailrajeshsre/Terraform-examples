variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["lawrence", "Venkat", "Mahesh"]
}