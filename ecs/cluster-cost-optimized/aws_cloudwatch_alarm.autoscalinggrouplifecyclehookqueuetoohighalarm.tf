resource "aws_cloudwatch_metric_alarm" "AutoScalingGroupLifecycleHookQueueTooHighAlarm" {
  alarm_name          = "AutoScalingGroupLifecycleHookQueueTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = "60"
  statistic           = "Maximum"
  threshold           = 600
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  treat_missing_data="notBreaching"
  dimensions = {
    QueueName = ""
  }
  alarm_description = "Queue contains messages older than 10 minutes, messages are not consumed"
  alarm_actions     = []
}
