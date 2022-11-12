resource "aws_autoscaling_policy" "ScaleDownPolicy" {
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleDownPolicy"
  min_adjustment_magnitude = "1"
  policy_type = "StepScaling"
  step_adjustment="[{0xc000523ca8 <nil> -25   [] map[] }]"
}
