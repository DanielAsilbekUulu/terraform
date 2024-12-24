provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "tls_connector" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name = "terraform_ec2_key"
  public_key = tls_private_key.tls_connector.public_key_openssh

  tags = {
    Owner = "Daniel"
  }
}

resource "local_file" "terraform_ec2_key_file" {
  content = tls_private_key.tls_connector.private_key_pem
  filename = "terraform_ec2_key.pem" #whatever content was created above here,it put that into this file

  provisioner "local-exec" {
    command = "chmod 400 terraform_ec2_key.pem"
  }
}

resource "aws_instance" "frontend" {
  ami = "ami-0368464534f5830c3"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_ec2_key.id
  subnet_id = "subnet-0b674f82f71582016"
  associate_public_ip_address = true
  security_groups = ["sg-018d6a86b71b44fa0"]


  provisioner "remote-exec" {
    inline = [ 
        "sudo apt-get update",
        "sudo apt-get install -y apache2"
     ]
  }

  
}

output "public_ip" {
  value = aws_instance.frontend.public_ip
}
