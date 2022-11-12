resource "aws_cloudwatch_event_rule" "LoadBalancerHttpsListenerRule" {
  name="LoadBalancerHttpsListenerRule"
  description         = "<nil>"
  event_pattern = jsonencode({"detail":{"eventType":["ERROR","WARN"]},"detail-type":["ECS Service Action"],"resources":[null],"source":["aws.ecs"]})
}

resource "aws_cloudwatch_event_target" "rule" {
  arn  = ""
  rule = aws_cloudwatch_event_rule.LoadBalancerHttpsListenerRule.id
}
