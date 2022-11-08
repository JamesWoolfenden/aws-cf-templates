resource "aws_cloudwatch_metric_alarm" "EFSFileSystemBurstCreditBalanceTooLowAlarm" {
  alarm_name          = "EFSFileSystemBurstCreditBalanceTooLowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "BurstCreditBalance"
  namespace           = "AWS/EFS"
  period              = "600"
  statistic           = "Average"
  threshold           = 1.92e+11
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    FileSystemId = ""
  }
  alarm_description = "Average burst credit balance over last 10 minutes too low, expect a significant performance drop soon."
  alarm_actions     = []
}
