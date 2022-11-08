resource "aws_cloudwatch_metric_alarm" "DatabaseDiskQueueDepthTooHighAlarm" {
  alarm_name          = "DatabaseDiskQueueDepthTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "DiskQueueDepth"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 64
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.Database.id
  }
  alarm_description = "Average database disk queue depth over last 10 minutes higher than 64, performance may suffer"
  alarm_actions     = []
}
