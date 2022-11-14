resource "aws_autoscaling_group" "AutoScalingGroup" {
  max_size = 1
  min_size = 1
  name="AutoScalingGroup"
  capacity_rebalance= false
  default_cooldown=600
  health_check_grace_period= 900
  health_check_type      = "ELB"
  launch_template     {
    name   = aws_launch_template.LaunchTemplate.id
    version=1
  }
  load_balancers         = []
  enabled_metrics        = [
	"GroupDesiredCapacity"
	]

  protect_from_scale_in  = false
  tag {
    key="Name"
    propagate_at_launch=true
    value="ecs-cluster"
    }
  target_group_arns=[]
  termination_policies=[]
}
