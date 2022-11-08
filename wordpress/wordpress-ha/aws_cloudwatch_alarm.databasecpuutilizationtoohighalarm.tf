resource "aws_cloudwatch_metric_alarm" "DatabaseCPUUtilizationTooHighAlarm" {
  alarm_name          = "DatabaseCPUUtilizationTooHighAlarm"
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
    DBInstanceIdentifier = aws_db_instance.Database.id
  }
  alarm_description = "Average database CPU utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
