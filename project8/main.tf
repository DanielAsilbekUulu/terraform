provider "aws" {
  region = "us-east-1"
}

provider "random" {}

resource "aws_s3_bucket" "example" {
  bucket = "example-${random_pet.name.id}"
}

resource "aws_instance" "example" {
  ami = "ami-0368464534f5830c3"
  instance_type = "t2.micro"

  tags = {
    Name = "example-${random_id.instance.hex}"  #hex means length, how many characters do you want 
  }
}

resource "random_pet" "name" {
  length = 2
}

resource "random_id" "instance" {
  byte_length = 4
}

output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "instance_name" {
  value = aws_instance.example.tags.Name
}