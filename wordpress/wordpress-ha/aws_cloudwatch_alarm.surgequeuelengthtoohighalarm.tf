resource "aws_cloudwatch_metric_alarm" "SurgeQueueLengthTooHighAlarm" {
  alarm_name          = "SurgeQueueLengthTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 512
  metric_name         = "SurgeQueueLength"
  namespace           = "AWS/ELB"
  period              = "60"
  statistic           = "Maximum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    LoadBalancerName = aws_elb.LoadBalancer.name
  }
  alarm_description = "Elastic load balancer surge queue is queuing up. Requests will be dropped when more than 1024 requests are queued."
  alarm_actions     = []
}
