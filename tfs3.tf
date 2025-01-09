terraform {
  backend "s3" {
    bucket = "test-tf-deva"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "test1" {
  domain = "vpc"
}

output "eip_addr" {
  value = aws_eip.test1.public_ip
}