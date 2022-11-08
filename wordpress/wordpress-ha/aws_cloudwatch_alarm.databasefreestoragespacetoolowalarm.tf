resource "aws_cloudwatch_metric_alarm" "DatabaseFreeStorageSpaceTooLowAlarm" {
  alarm_name          = "DatabaseFreeStorageSpaceTooLowAlarm"
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
    DBInstanceIdentifier = aws_db_instance.Database.id
  }
  alarm_description = "Average database free storage space over last 10 minutes lower than 2 GB"
  alarm_actions     = []
}
