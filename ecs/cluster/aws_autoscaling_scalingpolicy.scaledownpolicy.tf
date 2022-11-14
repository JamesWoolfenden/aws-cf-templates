resource "aws_autoscaling_policy" "ScaleDownPolicy" {
  adjustment_type          = "PercentChangeInCapacity"
  autoscaling_group_name   = aws_autoscaling_group.AutoScalingGroup.name
  name                     = "ScaleDownPolicy"
  min_adjustment_magnitude = "1"
  policy_type              = "StepScaling"
  step_adjustment {
    scaling_adjustment          = -25
    metric_interval_lower_bound = 0
  }
}