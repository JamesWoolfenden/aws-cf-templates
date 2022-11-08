resource "aws_cloudwatch_metric_alarm" "DatabaseClusterCPUUtilizationTooHighAlarm" {
  alarm_name          = "DatabaseClusterCPUUtilizationTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "600"
  statistic           = "Average"
  threshold           = 80
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    DBClusterIdentifier = ""
  }
  alarm_description = "Average database cluster CPU utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
