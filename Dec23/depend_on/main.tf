resource "aws_instance" "myinstance" {
  ami           = "ami-0d63de463e6604d0a"
  instance_type = "t2.micro"

  tags = {
    Name = "myserver"
  }
  depends_on = [aws_s3_bucket.my_test_bucket]
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "my-test-bucket-rajesh"
    tags = {
    Name = "Test1-Bucket"
  }
}