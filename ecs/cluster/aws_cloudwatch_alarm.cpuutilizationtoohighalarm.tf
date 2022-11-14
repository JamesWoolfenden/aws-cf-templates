resource "aws_cloudwatch_metric_alarm" "CPUUtilizationTooHighAlarm" {
  alarm_name                = "CPUUtilizationTooHighAlarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ECS"
  period                    = "600"
  statistic                 = "Average"
  threshold                 = 80
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  dimensions = {
    ClusterName = aws_ecs_cluster.Cluster.name
  }
  alarm_description = "Average CPU utilization over last 10 minutes higher than 80%"
  alarm_actions     = []
}
