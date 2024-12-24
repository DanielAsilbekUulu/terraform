terraform {
  required_version = "~> 1.9.8"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.59.0"
    }

  }
}


provider "aws" {
  region = "us-east-1"
}


# the command for the replace is "terraform plan/apply --replace="aws_instance.instance_practice"
resource "aws_instance" "instance_practice" {
  # count = 2
  ami = "ami-0453ec754f44f9a4a" 
  instance_type = "t2.micro"

  tags = {
    Name = "my_apache_instance"
  }
}