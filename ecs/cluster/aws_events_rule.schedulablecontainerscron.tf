resource "aws_cloudwatch_event_rule" "SchedulableContainersCron" {
  name="SchedulableContainersCron"
  description         = "<nil>"
  schedule_expression = "rate(1 minute)"
  event_pattern = jsonencode(null)
}

resource "aws_cloudwatch_event_target" "lambda" {
  arn  = ""
  rule = aws_cloudwatch_event_rule.SchedulableContainersCron.id
}
