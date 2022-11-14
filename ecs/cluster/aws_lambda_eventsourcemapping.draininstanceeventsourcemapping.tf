resource "aws_lambda_event_source_mapping" "DrainInstanceEventSourceMapping" {
  event_source_arn               = ""
  function_name                  = aws_lambda_function.DrainInstanceLambda.arn
  starting_position              = "LATEST"
  batch_size                     = 1
  bisect_batch_on_function_error = false
  enabled                        = true
  function_response_types        = []
  queues                         = []
}
