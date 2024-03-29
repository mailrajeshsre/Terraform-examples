output "instance_ami" {
  value = aws_instance.myinstance.ami
}


output "instance_arn" {
  value = aws_instance.myinstance.arn
  sensitive = true
}

output "instance_cpu_count" {
  value = aws_instance.myinstance.cpu_core_count
}