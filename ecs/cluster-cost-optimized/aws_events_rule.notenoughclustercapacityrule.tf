resource "aws_cloudwatch_event_rule" "NotEnoughClusterCapacityRule" {
  name="NotEnoughClusterCapacityRule"
  description         = "Not enough resources to place service task. Scale up cluster."
  event_pattern = jsonencode({"detail":{"clusterArn":[null],"eventName":["SERVICE_TASK_PLACEMENT_FAILURE"],"eventType":["ERROR"]},"detail-type":["ECS Service Action"],"source":["aws.ecs"]})
}

resource "aws_cloudwatch_event_target" "lambda" {
  arn  = ""
  rule = aws_cloudwatch_event_rule.NotEnoughClusterCapacityRule.id
}
