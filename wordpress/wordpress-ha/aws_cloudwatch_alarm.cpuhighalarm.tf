resource "aws_cloudwatch_metric_alarm" "CPUHighAlarm" {
  alarm_name          = "CPUHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = 60
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    AutoScalingGroupName = ""
  }
  alarm_description = "Alarm if CPU load is high."
  alarm_actions     = []
}
