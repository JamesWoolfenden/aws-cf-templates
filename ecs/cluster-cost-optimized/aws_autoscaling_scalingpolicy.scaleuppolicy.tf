resource "aws_autoscaling_policy" "ScaleUpPolicy" {
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScaleUpPolicy"
  estimated_instance_warmup= 10
  policy_type = "StepScaling"
  step_adjustment {
     scaling_adjustment          = 1
     metric_interval_upper_bound = 0
  }
}
