resource "aws_autoscaling_lifecycle_hook" "AutoScalingGroupTerminatingLifecycleHook" {
  name                    = "AutoScalingGroupTerminatingLifecycleHook"
  autoscaling_group_name  = aws_autoscaling_group.AutoScalingGroup.name
  default_result          = "CONTINUE"
  heartbeat_timeout       = 600
  lifecycle_transition    = "autoscaling:EC2_INSTANCE_TERMINATING"
  notification_metadata   = ""
  notification_target_arn = ""
  role_arn                = aws_iam_role.AutoScalingGroupLifecycleHookIAMRole.arn
}
