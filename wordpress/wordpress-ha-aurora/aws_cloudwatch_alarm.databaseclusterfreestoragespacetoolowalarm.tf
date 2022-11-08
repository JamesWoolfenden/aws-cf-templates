resource "aws_cloudwatch_metric_alarm" "DatabaseClusterFreeStorageSpaceTooLowAlarm" {
  alarm_name          = "DatabaseClusterFreeStorageSpaceTooLowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 2.147483648e+09
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBClusterIdentifier = ""
  }
  alarm_description = "Average database cluster free storage space over last 10 minutes lower than 2 GB"
  alarm_actions     = []
}
