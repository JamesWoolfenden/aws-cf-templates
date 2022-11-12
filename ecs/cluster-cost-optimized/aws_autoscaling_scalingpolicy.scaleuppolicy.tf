resource "aws_autoscaling_policy" "ScaleUpPolicy" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleUpPolicy"
  estimated_instance_warmup= 10
  policy_type = "StepScaling"
  step_adjustment="[{<nil> 0xc0003a47d0 1   [] map[] }]"
}
