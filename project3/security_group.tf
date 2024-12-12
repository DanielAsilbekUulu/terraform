
resource "aws_security_group" "sg1" {
  name = "allow_ssh_and_http_practice"
  vpc_id = aws_vpc.my_vpc_practice.id

  ingress {
    description = "allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow HTTP"
    from_port = 80
    to_port =  80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
