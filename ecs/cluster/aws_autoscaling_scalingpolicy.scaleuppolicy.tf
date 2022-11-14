resource "aws_autoscaling_policy" "ScaleUpPolicy" {
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleUpPolicy"
  min_adjustment_magnitude = "1"
  policy_type = "StepScaling"
  step_adjustment="[{<nil> 0xc0000edb98 25   [] map[] }]"
}
