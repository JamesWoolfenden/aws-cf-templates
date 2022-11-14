resource "aws_autoscaling_policy" "ScalingUpPolicy" {
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScalingUpPolicy"
  cooldown               = 900
  min_adjustment_magnitude = "1"
  scaling_adjustment     = 25
}
