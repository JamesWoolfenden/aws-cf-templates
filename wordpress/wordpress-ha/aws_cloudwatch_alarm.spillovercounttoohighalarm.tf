resource "aws_cloudwatch_metric_alarm" "SpilloverCountTooHighAlarm" {
  alarm_name          = "SpilloverCountTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "SpilloverCount"
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
  alarm_description = "Elastic load balancer rejected requests because the surge queue is full."
  alarm_actions     = []
}
