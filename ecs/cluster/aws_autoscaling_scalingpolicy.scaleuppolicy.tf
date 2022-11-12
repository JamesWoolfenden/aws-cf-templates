resource "aws_autoscaling_policy" "ScaleUpPolicy" {
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleUpPolicy"
  min_adjustment_magnitude = "1"
  policy_type = "StepScaling"
  step_adjustment="[{<nil> 0xc00002fcf0 25   [] map[] }]"
}
