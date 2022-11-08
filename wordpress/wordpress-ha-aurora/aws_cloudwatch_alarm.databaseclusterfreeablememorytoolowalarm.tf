resource "aws_cloudwatch_metric_alarm" "DatabaseClusterFreeableMemoryTooLowAlarm" {
  alarm_name          = "DatabaseClusterFreeableMemoryTooLowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 6.7108864e+07
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBClusterIdentifier = ""
  }
  alarm_description = "Average database cluster freeable memory over last 10 minutes lower than 64 MB, performance may suffer"
  alarm_actions     = []
}
