resource "aws_autoscaling_policy" "ScaleDownPolicy" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleDownPolicy"
  estimated_instance_warmup= 10
  policy_type = "StepScaling"
  step_adjustment {
     scaling_adjustment          = -1
     metric_interval_lower_bound = 0
  }
}
