resource "aws_cloudwatch_metric_alarm" "ContainerInstancesExcessAlarm" {
  alarm_name          = "ContainerInstancesExcessAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 5
  threshold           = 0
  actions_enabled=false
  datapoints_to_alarm=5
  insufficient_data_actions=[]
  ok_actions=[]
  metric_query {
    id="overcapacity"
    expression="IF((100-cpu) >= capacity, 1, 0) AND IF ((100-memory) >= capacity, 1, 0)"
    label="overcapacity"
    return_data=true
  }
  metric_query {
    id="capacity"
    expression="100/instances"
    label="Percentual capacity per instance."
    return_data=false
  }
  metric_query {
    id="instances"
    label="<nil>"
    return_data=false
    metric {
      dimensions={
        AutoScalingGroupName = ""
      }
      metric_name="GroupDesiredCapacity"
      namespace="AWS/AutoScaling"
      period=60
      stat="Minimum"
      unit="Seconds"
    }
  }
  metric_query {
    id="cpu"
    label="<nil>"
    return_data=false
    metric {
      dimensions={
        ClusterName = ""
      }
      metric_name="CPUReservation"
      namespace="AWS/ECS"
      period=60
      stat="Maximum"
      unit="Seconds"
    }
  }
  metric_query {
    id="memory"
    label="<nil>"
    return_data=false
    metric {
      dimensions={
        ClusterName = ""
      }
      metric_name="MemoryReservation"
      namespace="AWS/ECS"
      period=60
      stat="Maximum"
      unit="Seconds"
    }
  }
  alarm_description = "Cluster is wasting container instances"
  alarm_actions     = []
}
