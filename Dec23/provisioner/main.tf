resource "aws_key_pair" "developer" {
  key_name   = "developer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCz75QDZMZigVo12GtdDN3oRFIkpqUxSg3GLpF/7xxeavacXped6yxW3iMahcxab5eODoOOGoSeMmQuv/zghxt+hx5LK4rp+fNJxJ06HzcYpJhfg5U6+QSiv9NZLe5TP/nATtKu8F7UQSdF2D76JkVZVF4pf0XAUPhnS5jZowD2ongi3h8MUak0hlKBl8EsHLTbnEt4qKkvBqDGirDF5nwfq5r6S4SFttzdreqCkmSan0DzdNWjjdlfVfqvC9HFPuaDg7B70t76RxXykQ9YPio7F+ue5zEleqIkxPZGHxySEWQlIdtedidzWb7SC+4xzl73YeiWGf5RbjGPGyAosOXPx9Qwof/6FBgI7Yahc6EjBGjJjEKx+TqgHJBxofAm3I6kQKF9ZSdb750FN1X/9+0Lr2rLKtFlpItS00NdzocbK7fiwTkgNDr3gV2XTdHd7vybCyQJ5FZafHv7hLBsxDzMBVgharV9G5WdLRcWbmiUVA+jf3iLILxEPeQ8+o18/s8= root@ip-172-31-13-225.ap-south-1.compute.internal"
}

resource "aws_instance" "prod" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t2.micro"
  key_name = "developer"
  tags = {
    Name = "Prod-Server"
  }
provisioner "file" {
    source = "/root/provisioner/index.html"
    destination = "/tmp/index.html"
      
}
provisioner "remote-exec" {
    inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo cp /tmp/index.html /var/www/html",
        "sudo systemctl restart httpd"
    ]
  }
connection {
  host = self.public_ip
  user = "ec2-user"
  type = "ssh"
  private_key = file("./developer")
 }
}