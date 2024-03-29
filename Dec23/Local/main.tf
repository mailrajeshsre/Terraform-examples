terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

resource "local_file" "demo" {
  content  = "Hello Rajesh!"
  filename = "hello.txt"
}

