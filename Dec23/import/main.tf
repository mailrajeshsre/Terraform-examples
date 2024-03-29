#terraform import aws_instance.manual_ec2 i-03f69ae5fa9a53672
#terraform show

/*
resource "aws_instance" "manual_ec2" {
    ami = "ami-0449c34f967dbf18a"
    instance_type = "t2.micro"
    tags = {
        Name = "manual_ec2_instance"
    }
}
*/

#terraform import aws_s3_bucket.my_test_bucket my-demo-rajesh-devops-bucket
resource "aws_s3_bucket" "my_test_bucket"{
    bucket = "my-demo-rajesh-devops-bucket"
    tags = {
        Name = "test-bucket"
    }

}

#terrform import aws_s3_bucket_acl.example my-demo-rajesh-devops-bucket
resource "aws_s3_bucket_acl" "example"{
    bucket = aws_s3_bucket.my_test_bucket.id
}