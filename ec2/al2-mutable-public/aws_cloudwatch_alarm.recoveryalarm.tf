resource "aws_cloudwatch_metric_alarm" "RecoveryAlarm" {
  alarm_name          = "RecoveryAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 5
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"
  threshold           = 0
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    InstanceId = ""
  }
  alarm_description = "Recovering instance when underlying hardware fails."
  alarm_actions     = [
	"arn:aws:automate:us-east-1:ec2:recover"
	]

}
