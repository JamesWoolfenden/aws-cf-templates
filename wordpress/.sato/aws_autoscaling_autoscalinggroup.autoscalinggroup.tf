resource "aws_autoscaling_group" "AutoScalingGroup" {
  max_size = 4
  min_size = 2
  name="AutoScalingGroup"
  capacity_rebalance= false
  default_cooldown=60
  health_check_grace_period= 600
  health_check_type      = "ELB"
  launch_configuration   = ""
  launch_template        = {<nil> <nil>    [] map[] }
  load_balancers         = []
  enabled_metrics        = []
  protect_from_scale_in  = false
  tags = {
  