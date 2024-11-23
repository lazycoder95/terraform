provider "aws" {
  region     = "ap-south-1"
}


variable "ec2name" {
  type = list
  default = ["master","slave1","slave2"]
  }

variable "uname" {
  type = list
  default = ["root","man"]
}

resource "aws_instance" "first_ec2" {
    ami = var.ec2_ami
    instance_type = "t2.micro"
    count = 3
    tags = {Name=var.ec2name[count.index]}
}

resource "aws_iam_user" "test" {
  name = var.uname[count.index]
  count = 2
}