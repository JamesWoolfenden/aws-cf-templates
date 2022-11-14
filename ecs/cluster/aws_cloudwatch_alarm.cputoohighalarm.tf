resource "aws_cloudwatch_metric_alarm" "CPUTooHighAlarm" {
  alarm_name                = "CPUTooHighAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "600"
  statistic                 = "Average"
  threshold                 = 80
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.AutoScalingGroup.name
  }
  alarm_description = "Average CPU utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
