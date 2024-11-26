provider "aws" {
    region = "ap-south-1"
}

variable "desc" {
    type = map
    default = {name="test"}
}

locals {
    creationtime = "date-${formatdate("DDMMYYYY",timestamp())}"
}

resource "aws_instance" "cond_ec2" {
  ami = "ami-08bf489a05e916bbd"
  instance_type = "t2.micro"
  tags ={
    Name = count.index
    time = local.creationtime
  }
  count = 2
}