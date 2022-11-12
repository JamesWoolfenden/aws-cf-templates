resource "aws_cloudwatch_metric_alarm" "MemoryReservationTooHighAlarm" {
  alarm_name          = "MemoryReservationTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "MemoryReservation"
  namespace           = "AWS/ECS"
  period              = "600"
  statistic           = "Average"
  threshold           = 90
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
  }
  alarm_description = "Average memory reservation over last 10 minutes higher than 90%"
  alarm_actions     = []
}
