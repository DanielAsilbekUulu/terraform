# What to create !
resource "aws_launch_configuration" "launch_configuration" {
  name_prefix = "launch_configuration-"       #optional  # name should start with launch_configuration-

  image_id = "ami-0368464534f5830c3"    #required
  instance_type = "t2.micro"            #required
 # key_name = "tests"

  security_groups = [ aws_security_group.sg1.id]    #optional
  associate_public_ip_address = true    #optional  
  user_data = file("data.sh")        #optional  #this is important, now we dont manually install apache. I have to provide all the commands in the data.sh file, Terraform is gonna run it 


  lifecycle {
    create_before_destroy = true # I'm using create_before_destroy here to create new instances from
  }
}