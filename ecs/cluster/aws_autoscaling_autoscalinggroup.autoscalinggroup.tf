resource "aws_autoscaling_group" "AutoScalingGroup" {
  name="AutoScalingGroup"
  capacity_rebalance= false
  default_cooldown=120
  health_check_grace_period= 900
  health_check_type      = "ELB"
  launch_template     {
    name   = ""
    version=1
  }
  load_balancers         = []
  enabled_metrics        = []
  protect_from_scale_in  = false
  tag {
    key="Name"
    propagate_at_launch=true
    value="ecs-cluster"
    }
  target_group_arns=[]
  termination_policies=[]
}
