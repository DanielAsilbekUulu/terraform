#resource "aws_elb" "elb" {
  name = "elb"

  subnets = [
    "${aws_subnet.my_public_subnet_practice.id}",
    "${aws_subnet.my_private_subnet_practice.id}"
  ]

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
}