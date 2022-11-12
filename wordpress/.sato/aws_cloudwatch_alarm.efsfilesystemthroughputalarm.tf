resource "aws_cloudwatch_metric_alarm" "EFSFileSystemThroughputAlarm" {
  alarm_name          = "EFSFileSystemThroughputAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 10
  threshold           = 80
  actions_enabled=false
  datapoints_to_alarm=6
  insufficient_data_actions=[]
  ok_actions=[]
  metric_query {
    id="m1"
    label="MeteredIOBytes"
    return_data=false
    metric {
      dimensions={
        FileSystemId = ""
      }
      metric_name="MeteredIOBytes"
      namespace="AWS/EFS"
      period=60
      stat="Sum"
      unit="Bytes"
    }
  }
  metric_query {
    id="m2"
    label="PermittedThroughput"
    return_data=false
    metric {
      dimensions={
        FileSystemId = ""
      }
      metric_name="PermittedThroughput"
      namespace="AWS/EFS"
      period=60
      stat="Sum"
      unit="Bytes/Second"
    }
  }
  metric_query {
    id="e1"
    expression="(m1/1048576)/PERIOD(m1)"
    label="e1"
    return_data=false
  }
  metric_query {
    id="e2"
    expression="m2/1048576"
    label="e2"
    return_data=false
  }
  metric_query {
    id="e3"
    expression="((e1)*100)/(e2)"
    label="Throughput utilization (%)"
    return_data=true
  }
  alarm_description = "Reached 80% of the permitted throughput 6 times over last 10 minutes."
  alarm_actions     = []
}
