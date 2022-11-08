resource "aws_cloudwatch_metric_alarm" "HTTPCodeTarget5XXTooHighAlarm" {
  alarm_name          = "HTTPCodeTarget5XXTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HTTPCode_Backend_5XX"
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
  alarm_description = "Elastic load balancer receives 5XX HTTP status codes from backends"
  alarm_actions     = []
}
