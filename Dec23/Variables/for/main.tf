/* resource "aws_iam_user" "myiamuser" {
  for_each = var.user_names
  name     = each.value

} */

output "print_the_user" {
  value = [for name in var.user_names : name]
}