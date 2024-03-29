resource "aws_key_pair" "deployer" {
  key_name   = "mynewkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8Kp44OAxrfx0G86ZpnbZw3CZCzehR/BcCkgwDzmEhnqOUKM14cZQhIpupCXxhnSPse0LIZDgZEpSPu06BLzQPb80ni+Om7jtYb1CZ2+AG2IeI0vSZH2gvLafQ2WbprFw+ckQXVYpXmIb6Xl/a/nAUgCWIqQA5DH5YIT2lzUtFTuNjWf1DtHZGVue0l0VbkTwZGffHq3vejApq316R6LF3oyhhlNlyN9+JjBZWd3DpEWtiqKEZlpvJ24UszlkElZ99qPl+WVKhPFzOnm9ggKJU4cGw0aati9hQd78t27ziHhwinVqrbaV9oSezxeujhyYH1dHl0Usv5DmqoBGVPNSKhjA2qzRlPukmIsdDT1bHFlEX4GIrHgGn9ymo9nYnEGculol8ISQFzsnk0hYat1OvrURt6E4DnZl241KHe+2b+FUSnHmXxHsceDEkutMDvzfNqsfXIFvh1S8hpo/mRrMSxzngKvUb/wkzrgtLJ7AbjXH/eF2xy0MQ6OtFerenzKE= rajesh@LAPTOP-IRKOTMD4"
}

resource "aws_instance" "myserver" {
    ami = "ami-03f4878755434977f"
    instance_type = "t2.micro"
    key_name = "mynewkey"
    tags = {
        Name = "Linux-server"
    }
}