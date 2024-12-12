/*resource "aws_autoscaling_group" "asg" {       # "aws_autoscaling_group" this part creates auto scaling group    #"asg" this one we can call whatever we want 
  name = "${aws_launch_configuration.launch_configuration.name}-asg"   #it's a name of the auto scaling group  #it's optional (name)
 

 min_size = 1           # here in this file we have only few lines required,most of them are optional   # this line is required 
 desired_capacity = 2
 max_size = 3           # this line also required

 launch_configuration = aws_launch_configuration.launch_configuration.name    #it's my own launch_configuration

 tag {
   key = "Name"
   value = "Web"
   propagate_at_launch = true
 }

}  */