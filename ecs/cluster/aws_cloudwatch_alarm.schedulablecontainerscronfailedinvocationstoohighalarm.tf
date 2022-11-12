resource "aws_cloudwatch_metric_alarm" "SchedulableContainersCronFailedInvocationsTooHighAlarm" {
  alarm_name          = "SchedulableContainersCronFailedInvocationsTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FailedInvocations"
  namespace           = "AWS/Events"
  period              = "60"
  statistic           = "Sum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  treat_missing_data=notBreaching
  dimensions = {
    RuleName = ""
  }
  alarm_description = "Invocations failed permanently"
  alarm_actions     = []
}
