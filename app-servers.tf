/* AWS Launch Configuration */
resource "aws_launch_configuration" "alc" {
    name = "alc"
    image_id = "${var.ami_id}"
    security_groups = [ "${aws_security_group.web.id}"]
    instance_type = "c3.large"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a", "us-east-1b"]
  name = "asg"
  min_size = 2
  max_size = 2
  desired_capacity = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  force_delete = true
  launch_configuration = "${aws_launch_configuration.alc.name}"
  load_balancers = ["${aws_elb.elb.name}"]
  vpc_zone_identifier = [ "${aws_subnet.public-1a.id}", "${aws_subnet.public-1b.id}" ]
}

/* Load balancer */
resource "aws_elb" "elb" {
  #name = "elb"
  #availability_zones = ["us-east-1a", "us-east-1b"]
  subnets = [ "${aws_subnet.public-1a.id}", "${aws_subnet.public-1b.id}" ]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 30
    target = "HTTP:80/"
    interval = 60
  }

}

# This should put an elastic ip in front of the elb. unfortunately it errors out. 
#resource "aws_eip" "public-ip" {
#    instance = "${aws_elb.elb.id}"
#}
