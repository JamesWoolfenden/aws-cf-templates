resource "aws_cloudwatch_metric_alarm" "CPUUtilizationLowAlarm" {
  alarm_name          = "CPUUtilizationLowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = 30
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
    ServiceName = ""
  }
  alarm_description = "Service is wasting CPU"
  alarm_actions     = []
}
