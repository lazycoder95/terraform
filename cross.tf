provider "aws" {
    region = "ap-south-1"
}

resource "aws_eip" "ip" {
    domain = "vpc"  
}

resource "aws_security_group" "cross-network" {
    name = "cross reference sg"
}

resource "aws_vpc_security_group_ingress_rule" "eip_rule" {
  security_group_id = aws_security_group.cross-network.id
  cidr_ipv4         = "${aws_eip.ip.public_ip}/32"
  from_port         = var.port
  ip_protocol       = var.def_protocal
  to_port           = 443

}

resource "aws_vpc_security_group_egress_rule" "out_rule" {
  security_group_id = aws_security_group.cross-network.id
  cidr_ipv4 = "${aws_eip.ip.public_ip}/32"
  from_port = var.port
  ip_protocol = var.def_protocal
  to_port = var.port
}

output "public_ip" {
  value= aws_eip.ip.public_ip
}