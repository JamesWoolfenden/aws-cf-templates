resource "aws_cloudwatch_metric_alarm" "DiskTooHighAlarm" {
  alarm_name          = "DiskTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "disk_used_percent"
  namespace           = "goformation-stack"
  period              = "600"
  statistic           = "Average"
  threshold           = 80
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    InstanceId = ""
    fstype = "xfs"
    path = "/"
  }
  alarm_description = "Average disk utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
