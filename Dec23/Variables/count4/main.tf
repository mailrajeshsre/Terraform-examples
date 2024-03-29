resource "aws_iam_user" "users"{
    for_each = toset (["Rajesh","Mahesh","Suresh"])
    name = each.key
    tags = {
        Name = each.key
    }
}