resource "aws_cloudwatch_metric_alarm" "MemoryUtilizationTooHighAlarm" {
  alarm_name          = "MemoryUtilizationTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "600"
  statistic           = "Average"
  threshold           = 80
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
  }
  alarm_description = "Average memory utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
