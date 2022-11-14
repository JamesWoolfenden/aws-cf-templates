resource "aws_cloudwatch_metric_alarm" "AutoScalingGroupLifecycleHookDeadLetterQueueTooHighAlarm" {
  alarm_name                = "AutoScalingGroupLifecycleHookDeadLetterQueueTooHighAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "ApproximateNumberOfMessagesVisible"
  namespace                 = "AWS/SQS"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = 0
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  treat_missing_data        = "notBreaching"
  dimensions = {
    QueueName = aws_sqs_queue.AutoScalingGroupLifecycleHookQueue.name
  }
  alarm_description = "Dead letter queue contains messages, message processing failed"
  alarm_actions     = []
}
