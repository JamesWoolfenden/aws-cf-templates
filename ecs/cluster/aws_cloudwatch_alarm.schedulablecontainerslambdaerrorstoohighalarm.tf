resource "aws_cloudwatch_metric_alarm" "SchedulableContainersLambdaErrorsTooHighAlarm" {
  alarm_name                = "SchedulableContainersLambdaErrorsTooHighAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "Errors"
  namespace                 = "AWS/Lambda"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = 0
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  treat_missing_data        = "notBreaching"
  dimensions = {
    FunctionName = ""
  }
  alarm_description = "Invocations failed due to errors in the function"
  alarm_actions     = []
}
