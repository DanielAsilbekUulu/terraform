## step 1 ##
resource "aws_instance" "instance" {
  ami = "example"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}


## step 2 ##
resource "aws_instance" "instance" {
  ami = ""
  instance_type = "t2.micro"

  tags = {
    
  }
}