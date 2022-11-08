resource "aws_cloudwatch_metric_alarm" "DatabaseFreeableMemoryTooLowAlarm" {
  alarm_name          = "DatabaseFreeableMemoryTooLowAlarm"
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
    DBInstanceIdentifier = aws_db_instance.Database.id
  }
  alarm_description = "Average database freeable memory over last 10 minutes lower than 64 MB, performance may suffer"
  alarm_actions     = []
}
