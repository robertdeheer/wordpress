output "nat.ip" {
  value = "${aws_instance.nat.public_ip}"
}

output "elb.hostname" {
  value = "${aws_elb.elb.dns_name}"
}
