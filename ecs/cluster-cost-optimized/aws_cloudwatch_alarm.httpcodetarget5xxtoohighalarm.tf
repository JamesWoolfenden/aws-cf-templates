resource "aws_cloudwatch_metric_alarm" "HTTPCodeTarget5XXTooHighAlarm" {
  alarm_name          = "HTTPCodeTarget5XXTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  treat_missing_data=notBreaching
  dimensions = {
    LoadBalancer = ""
    TargetGroup = ""
  }
  alarm_description = "Application load balancer receives 5XX HTTP status codes from targets"
  alarm_actions     = []
}
