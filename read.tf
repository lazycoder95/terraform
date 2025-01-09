resource "aws_security_group" "sg1" {
  name = "allow tls"
}

resource "aws_vpc_security_group_ingress_rule" "inrules" {
    security_group_id = aws_security_group.sg1.id
    cidr_ipv4 = "${data.terraform_remote_state.vpc.outputs.eip_addr}/32"
    ip_protocol = "tcp"
    to_port = 80
    from_port = 443
  
}