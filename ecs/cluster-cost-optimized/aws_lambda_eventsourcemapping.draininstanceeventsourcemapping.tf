resource "aws_lambda_event_source_mapping" "DrainInstanceEventSourceMapping" {
  event_source_arn  = ""
  function_name     = ""
  starting_position = ""
  batch_size=1
  bisect_batch_on_function_error=false
  enabled = true
  function_responses_types= []
  queues=[]
}
