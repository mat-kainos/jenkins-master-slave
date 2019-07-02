data "http" "my_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "sec_group" {
  name   = "${var.tag_name}"
  vpc_id = "${aws_vpc.vpc.id}"

}

resource "aws_security_group_rule" "allow_all_my_cidr_and_internal" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["${chomp(data.http.my_ip.body)}/32", "${var.network["vpc_cidr_block"]}"]
  security_group_id = "${aws_security_group.sec_group.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sec_group.id}"
}
