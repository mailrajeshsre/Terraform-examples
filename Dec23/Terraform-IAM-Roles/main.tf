resource "aws_iam_role" "demo_role" {
  name = "demo_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "demo_role"
  }
}


resource "aws_iam_role_policy_attachment" "demo-attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.demo_role.name

}

resource "aws_iam_instance_profile" "demo_profile" {
  name = "demo_profile"
  role = aws_iam_role.demo_role.name
}

resource "aws_instance" "demo_instance" {
  ami                  = "ami-0d980397a6e8935cd"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.demo_profile.name

  tags = {
    Name = "demo_instance"
  }
}