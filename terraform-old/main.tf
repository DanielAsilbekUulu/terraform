# use data source to pull the AMI id 
data "aws_ami" "with_apacheAMI" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*apache*"]
  }
}
# create a EC2 instance
resource "aws_instance" "hisec2" {
  ami = data.aws_ami.with_apacheAMI.id
 # ami           = var.ami      (it is for the ami for different environment)
  instance_type               = var.my_instance_type             #instance_type isn't variable,it must be there. my_instance_type is variable, we can change it however we want!
  associate_public_ip_address = true
}

