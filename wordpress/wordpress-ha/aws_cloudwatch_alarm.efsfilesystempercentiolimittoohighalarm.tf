resource "aws_cloudwatch_metric_alarm" "EFSFileSystemPercentIOLimitTooHighAlarm" {
  alarm_name          = "EFSFileSystemPercentIOLimitTooHighAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "PercentIOLimit"
  namespace           = "AWS/EFS"
  period              = "600"
  statistic           = "Maximum"
  threshold           = 95
  actions_enabled=false
  insufficient_data_actions=[]
  ok_actions=[]
  dimensions = {
    FileSystemId = aws_efs_file_system.EFSFileSystem.id
  }
  alarm_description = "I/O limit has been reached, consider using Max I/O performance mode."
  alarm_actions     = [aws_autoscaling_policy.ScalingUpPolicy.arn]
}
