/*
resource "aws_autoscaling_policy" "web_policy_up_practice" {
  name                   = "web_policy_up_practice"
  scaling_adjustment     = 1
  autoscaling_group_name = aws_autoscaling_group.asg.name      #sometimes it's id, sometimes it's name
} */