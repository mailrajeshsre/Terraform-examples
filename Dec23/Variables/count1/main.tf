resource "random_string" "random" {
  length  = 16
  special = false
  upper   = false
  count   = 3
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "rajeshtechvar.${random_string.random[count.index].id}"
  count  = 3
  tags = {
    Name = "Mybucket1.${count.index}"
  }
}