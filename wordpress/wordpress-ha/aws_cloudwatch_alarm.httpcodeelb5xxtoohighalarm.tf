resource "aws_cloudwatch_metric_alarm" "HTTPCodeELB5XXTooHighAlarm" {
  alarm_name          = "HTTPCodeELB5XXTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_ELB_5XX"
  namespace           = "AWS/ELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    LoadBalancerName = aws_elb.LoadBalancer.name
  }
  alarm_description = "Elastic load balancer returns 5XX HTTP status codes"
  alarm_actions     = []
}
