
resource "aws_appautoscaling_policy" "ScaleDownPolicy" {
  name               = "goformation-stack-scale-down"
  policy_type        = "StepScaling"
  resource_id        = ""
  scalable_dimension = ""
  service_namespace  = ""
  step_scaling_policy_configuration {
    adjustment_type= "PercentChangeInCapacity"
    cooldown=300
    metric_aggregation_type=""
 min_adjustment_type=1
    step_adjustment {
      metric_interval_upper_bound=0
      scaling_adjustment=-25
    }
  }
}
