resource "aws_cloudwatch_metric_alarm" "RejectedConnectionCountTooHighAlarm" {
  alarm_name                = "RejectedConnectionCountTooHighAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "RejectedConnectionCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = 0
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  treat_missing_data        = "notBreaching"
  dimensions = {
    LoadBalancer = aws_lb.LoadBalancer.name
  }
  alarm_description = "Application load balancer rejected connections because the load balancer had reached its maximum number of connections"
  alarm_actions     = []
}
