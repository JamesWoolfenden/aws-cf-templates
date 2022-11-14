resource "aws_cloudwatch_metric_alarm" "RecordSetIPv6" {
  alarm_name          = "RecordSetIPv6"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "TargetConnectionErrorCount"
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
  alarm_description = "Application load balancer could not connect to targets"
  alarm_actions     = []
}
