/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

/* Public subnet */
resource "aws_subnet" "public-1a" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_1a_subnet_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags {
    Name = "public-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_1b_subnet_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.default"]
  tags {
    Name = "public-1b"
  }
}

/* Routing tables for public subnet */
resource "aws_route_table" "public-1a" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

resource "aws_route_table" "public-1b" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "public-1a" {
  subnet_id = "${aws_subnet.public-1a.id}"
  route_table_id = "${aws_route_table.public-1a.id}"
}

resource "aws_route_table_association" "public-1b" {
  subnet_id = "${aws_subnet.public-1b.id}"
  route_table_id = "${aws_route_table.public-1b.id}"
}
