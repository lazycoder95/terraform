provider "aws" {
  region     = "us-west-1"
}


resource "aws_instance" "first_ec2" {
    ami = "ami-08bf489a05e916bbd"
    instance_type = "t2.nano"

    tags = {Name="first-ec2"}
}