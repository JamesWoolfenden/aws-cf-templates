resource "aws_autoscaling_policy" "ScaleUpPolicy" {
  adjustment_type          = "PercentChangeInCapacity"
  autoscaling_group_name   = aws_autoscaling_group.AutoScalingGroup.name
  name                     = "ScaleUpPolicy"
  min_adjustment_magnitude = "1"
  policy_type              = "StepScaling"
  step_adjustment {
    scaling_adjustment          = 25
    metric_interval_upper_bound = 0
  }
}
