resource "aws_vpc" "vpc" {
  cidr_block           = "${var.network["vpc_cidr_block"]}"
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Name = "${var.tag_name}",
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "${var.tag_name}",

  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.network["subnet_cidr_block"]}"

  tags = {
    Name = "${var.tag_name}",
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags = {
    Name = "${var.tag_name}",
  }
}

resource "aws_route_table_association" "route_table_assoc" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}


