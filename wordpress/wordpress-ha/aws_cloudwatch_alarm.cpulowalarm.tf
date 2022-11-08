resource "aws_cloudwatch_metric_alarm" "CPULowAlarm" {
  alarm_name          = "CPULowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = 30
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    AutoScalingGroupName = ""
  }
  alarm_description = "Alarm if CPU load is low."
  alarm_actions     = []
}
