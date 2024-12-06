# use data source to pull the AMI id 
data "aws_ami" "forgotAIMbek" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*forgotAIM*"]
  }
}
# create a EC2 instance
resource "aws_instance" "hisec2" {
  ami = data.aws_ami.forgotAIMbek.id
 # ami           = var.ami      (it is for the ami for different environment)
  instance_type               = var.my_instance_type             #instance_type isn't variable,it must be there. my_instance_type is variable, we can change it however we want!
  associate_public_ip_address = true
}

