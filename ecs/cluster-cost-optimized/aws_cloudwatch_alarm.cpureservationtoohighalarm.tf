resource "aws_cloudwatch_metric_alarm" "CPUReservationTooHighAlarm" {
  alarm_name          = "CPUReservationTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "CPUReservation"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = 90
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
  }
  alarm_description = "Average CPU reservation over last 10 minutes higher than 90%"
  alarm_actions     = []
}
