resource "aws_cloudwatch_metric_alarm" "ContainerInstancesExcessAlarm" {
  alarm_name                = "ContainerInstancesExcessAlarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 15
  metric_name               = "SchedulableContainers"
  namespace                 = "goformation-stack"
  period                    = "60"
  statistic                 = "Maximum"
  threshold                 = 10
  actions_enabled           = false
  datapoints_to_alarm       = 15
  insufficient_data_actions = []
  ok_actions                = []
  dimensions = {
    ClusterName = aws_ecs_cluster.Cluster.name
  }
  alarm_description = "Cluster is wasting container instances"
  alarm_actions     = []
}
