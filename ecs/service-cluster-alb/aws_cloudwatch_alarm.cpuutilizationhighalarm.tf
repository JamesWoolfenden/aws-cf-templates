resource "aws_cloudwatch_metric_alarm" "CPUUtilizationHighAlarm" {
  alarm_name          = "CPUUtilizationHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = 60
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
    ServiceName = ""
  }
  alarm_description = "Service is running out of CPU"
  alarm_actions     = []
}
