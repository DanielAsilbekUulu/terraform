# vpc.tf & instance.tf = main.tf 

# Block 1: Generate RSA Private Key  #i think it's ssh private key
# this block generates an RSA private key using the tls_private_key resource from the tls provider
resource "tls_private_key" "tlc_connector_practice" {    
  algorithm = "RSA"   # Key pair type
  rsa_bits = 4096    # RSA key size of 4096 bits  # The private key is created with 4096-bit RSA encryption.
}      


# Block 2: Create EC2 Key Pair Using the Public Key
#this block is gonna create an EC2 key pair in AWS # This key pair allows you to securely SSH into your EC2 instances without using a password. #This key pair can be used to securely SSH into EC2 instances without passwords, using the associated private key.
resource "aws_key_pair" "terraform_ec2_key_practice" {    
  key_name = var.key_pair_name      # The key pair is named based on the key_pair_name variable
  public_key = tls_private_key.tlc_connector_practice.public_key_openssh       # <-- this thing is also interpolation

  tags = {
    Owner = "daniel"
  }
}
 
#block 3: Stores Private Key Locally 
#this block creates a local file that stores the private key (in PEM format) # this block is gonna create a file called terraform_ec2_key.pem and
resource "local_file" "terraform_ec2_key_file" {        # local_file is a resource from the local provider. It allows you to create or manage files on your local machine
  content = tls_private_key.tlc_connector_practice.private_key_pem
  filename = "terraform_ec2_key.pem"

  provisioner "local-exec" {    # The local-exec provisioner runs a command locally
    command = "chmod 400 terraform_ec2_key.pem"
  }
}
#Once everything is set up, you can SSH into your EC2 instance like so:
# ssh -i terraform_ec2_key.pem ec2-user@<ec2-public-ip>
# ssh -i key name  ec2-user@ip address of my machine






data "aws_ami" "forgotAIMbek" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*apache*"]
  }
}

resource "aws_instance" "frontend" {
  ami = data.aws_ami.forgotAIMbek.id
  instance_type = var.instance_type
  key_name = aws_key_pair.terraform_ec2_key_practice.id
  subnet_id = aws_subnet.my_public_subnet_practice.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.allow_ssh_and_http_practice.id]   # i need to put values in the [square brackets] if it says 's' in the end (multiple) f.e. values, security_groups, etc.

  tags = {
    Name = "frontend"
    Owner = "daniel"
  }
}