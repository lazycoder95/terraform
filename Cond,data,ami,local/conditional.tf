/*provider "aws" {
    region = var.region
}

variable "env" {
  
}

variable "region" {
  
}
resource "aws_instance" "cond_ec2" {
  ami = "ami-08bf489a05e916bbd"
  instance_type = var.env == "dev" || var.region == "ap-south-1" ? "t2.micro" : "t2.medium"
}*/