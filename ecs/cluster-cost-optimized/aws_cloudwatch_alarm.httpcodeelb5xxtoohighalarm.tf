resource "aws_cloudwatch_metric_alarm" "HTTPCodeELB5XXTooHighAlarm" {
  alarm_name          = "HTTPCodeELB5XXTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  treat_missing_data="notBreaching"
  dimensions = {
    LoadBalancer = ""
  }
  alarm_description = "Application load balancer returns 5XX HTTP status codes"
  alarm_actions     = []
}
