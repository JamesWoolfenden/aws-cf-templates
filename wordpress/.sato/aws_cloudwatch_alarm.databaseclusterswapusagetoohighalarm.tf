resource "aws_cloudwatch_metric_alarm" "DatabaseClusterSwapUsageTooHighAlarm" {
  alarm_name          = "DatabaseClusterSwapUsageTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "SwapUsage"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 2.68435456e+08
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBClusterIdentifier = ""
  }
  alarm_description = "Average database cluster swap usage over last 10 minutes higher than 256 MB, performance may suffer"
  alarm_actions     = []
}
