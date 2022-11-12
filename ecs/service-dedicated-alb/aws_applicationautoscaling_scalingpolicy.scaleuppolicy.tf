
resource "aws_appautoscaling_policy" "ScaleUpPolicy" {
  name               = "goformation-stack-scale-up"
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
      metric_interval_lower_bound=0
      scaling_adjustment=25
    }
  }
}
