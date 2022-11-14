resource "aws_cloudwatch_metric_alarm" "ScaleUpLambdaThrottlesTooHighAlarm" {
  alarm_name          = "ScaleUpLambdaThrottlesTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Throttles"
  namespace           = "AWS/Lambda"
  period              = "60"
  statistic           = "Sum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  treat_missing_data=notBreaching
  dimensions = {
    FunctionName = ""
  }
  alarm_description = "Invocation attempts that were throttled due to invocation rates exceeding the concurrent limits"
  alarm_actions     = []
}
