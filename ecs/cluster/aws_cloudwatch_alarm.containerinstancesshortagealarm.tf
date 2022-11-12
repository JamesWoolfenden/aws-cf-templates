resource "aws_cloudwatch_metric_alarm" "ContainerInstancesShortageAlarm" {
  alarm_name          = "ContainerInstancesShortageAlarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "SchedulableContainers"
  namespace           = "goformation-stack"
  period              = "60"
  statistic           = "Minimum"
  threshold           = 2
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    ClusterName = ""
  }
  alarm_description = "Cluster is running out of container instances"
  alarm_actions     = []
}
