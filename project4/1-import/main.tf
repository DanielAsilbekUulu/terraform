# this is the command for the import ( terraform import aws_instance.my_instance_practice i-06fa8fb5c18ff96a3 )
## step 1 ##


resource "aws_instance" "my_instance_practice" {
  ami = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  disable_api_stop = false

  tags = {
    Name = "my_apache_instance"
  } 
}















## step 2 ##   # it's a simple EC2 instance terraform resource 
/*resource "aws_instance" "instance" {
  ami = ""
  instance_type = "t2.micro"

  tags = {
    name = "value"
  }
} */