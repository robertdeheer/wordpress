/* NAT/VPN server */
resource "aws_instance" "nat" {
  ami = "ami-8cdfaa9b"
  instance_type = "c3.large"
  subnet_id = "${aws_subnet.public-1a.id}"
  security_groups = ["${aws_security_group.default.id}", "${aws_security_group.nat.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  tags = {
    Name = "nat"
  }
  connection {
    user = "ubuntu"
    key_file = "/home/rdeheer/.ssh/insecure-deployer.pub"
  }
}
