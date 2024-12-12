resource "aws_autoscaling_group" "asg" {       # "aws_autoscaling_group" this part creates auto scaling group    #"asg" this one we can call whatever we want 
  name = "${aws_launch_configuration.launch_configuration.name}-asg"   #it's a name of the auto scaling group  #it's optional (name)
  

  min_size = 1       # here in this file we have only few lines required,most of them are optional   # this line is required 
  desired_capacity = 2
  max_size = 3       # this line also required

  health_check_type = "ELB"  #it's optional #Load balancers have their own health checks, Auto scaling groups also have their own health checks(but they're rarely used becuase load balancer health checks are more reliable)
  load_balancers = [
    aws_elb.elb.id
  ]

  launch_configuration = aws_launch_configuration.launch_configuration.name

  enabled_metrics = [       # it's also optional
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstance",
    "GroupTotalInstance"
   ]


  metrics_granularity = "1Minute"    #optional

  vpc_zone_identifier = [     #it's my own VPC #If I delete this block then I'll use AWS's VPC
    aws_subnet.my_public_subnet_practice.id
  ]

# Required to redeploy without an outage
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key = "Name"
    value = "Web"
    propagate_at_launch = true
  }

}