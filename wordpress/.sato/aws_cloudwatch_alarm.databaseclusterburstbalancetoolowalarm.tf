resource "aws_cloudwatch_metric_alarm" "DatabaseClusterBurstBalanceTooLowAlarm" {
  alarm_name          = "DatabaseClusterBurstBalanceTooLowAlarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "BurstBalance"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 20
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBClusterIdentifier = ""
  }
  alarm_description = "Average database cluster storage burst balance over last 10 minutes lower than 20%, expect a significant performance drop soon"
  alarm_actions     = []
}
