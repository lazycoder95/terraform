/*provider "aws" {
  region = var.location
}

resource "aws_instance" "test" {
  ami = data.aws_ami.ami_test.image_id
  instance_type = "t2.micro"
}

data "aws_ami" "ami_test" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/*"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

variable "location" {

}

variable "ingress_port" {
  type    = list(number)
  default = [81, 95, 8901, 8081]
}

resource "aws_security_group" "dynamic_group" {
  name = "sg for dynamic testing"

  dynamic "ingress" {
    for_each = var.ingress_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}*/