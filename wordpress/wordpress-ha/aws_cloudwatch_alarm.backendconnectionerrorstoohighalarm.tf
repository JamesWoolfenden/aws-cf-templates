resource "aws_cloudwatch_metric_alarm" "BackendConnectionErrorsTooHighAlarm" {
  alarm_name          = "BackendConnectionErrorsTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "BackendConnectionErrors"
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
  alarm_description = "Elastic load balancer backend connection errors"
  alarm_actions     = []
}
