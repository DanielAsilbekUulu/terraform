# When to create !
resource "aws_autoscaling_policy" "web_policy_up_practice" {
  name = "web_policy_up_practice"     #required
  scaling_adjustment = 1     #required          # 1 instance at a time  (it creates) # one by one (instance)
  adjustment_type = "ChangeInCapacity"  #optional
  cooldown = 300                  #optional  # 300=5 minutes, after a scaling activity completes and before the next scaling activity can start
  autoscaling_group_name = aws_autoscaling_group.asg.name         #required

}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_up_practice" {
  alarm_name = "cpu_alarm_up_practice"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "70"    # 70%  #if the CPU gets over 70%, ASG will start spinning more instances.

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ aws_autoscaling_policy.web_policy_up_practice.arn ]
} 



resource "aws_autoscaling_policy" "web_policy_down_practice" {
  name = "web_policy_down_practice"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_cloudwatch_metric_alarm" "web_cpu_alarm_down_practice" {
  alarm_name = "web_cpu_alarm_down_practice"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "30"   #if the CPU on my instances is less than 30%, ASG will scaling down, it decreases the number of instances (because that means customers are not using anything)

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ aws_autoscaling_policy.web_policy_down_practice.arn ]
}

