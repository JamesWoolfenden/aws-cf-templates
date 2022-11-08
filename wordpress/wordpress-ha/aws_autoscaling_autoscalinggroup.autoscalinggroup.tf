resource "aws_autoscaling_group" "AutoScalingGroup" {
  max_size = 4
  min_size = 2
  name="AutoScalingGroup"
  capacity_rebalance= false
  default_cooldown=60
  health_check_grace_period= 600
  health_check_type      = "ELB"
  launch_template     {
    name   = aws_launch_template.LaunchTemplate.name
    version=1
  }
  load_balancers         = []
  enabled_metrics        = []
  protect_from_scale_in  = false
  tag {
    key="Name"
    propagate_at_launch=true
    value="wordpress"
    }
  target_group_arns=[]
  termination_policies=[]
  vpc_zone_identifier=[ var.vpc_id]
}
