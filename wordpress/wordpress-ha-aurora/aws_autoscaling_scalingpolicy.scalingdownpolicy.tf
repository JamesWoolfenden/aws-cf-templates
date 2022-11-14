resource "aws_autoscaling_policy" "ScalingDownPolicy" {
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = ""
  name                   = "ScalingDownPolicy"
  cooldown               = 300
  min_adjustment_magnitude = "1"
  scaling_adjustment     = -25
}