resource "aws_appautoscaling_target" "ScalableTarget" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${var.Cluster}/${var.Service}"
  role_arn           = ""
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}
