provider "aws" {
  region = "ap-south-1"
}


variable "type" {
}

data "aws_ami" "myami" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_instance" "ami_test" {
    ami = data.aws_ami.myami.image_id
    instance_type = var.type
}