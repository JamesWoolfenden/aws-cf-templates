resource "aws_lambda_function" "DrainInstanceLambda" {
  function_name = "DrainInstanceLambda"
  role          = aws_iam_role.DrainInstanceLambdaRole.arn
  environment {
    variables = {
      "CLUSTER"   = ""
      "QUEUE_URL" = ""
    }
  }
  filename                       = "DrainInstanceLambda.zip"
  handler                        = "index.handler"
  layers                         = []
  memory_size                    = 128
  reserved_concurrent_executions = 1
  runtime                        = "nodejs16.x"
  timeout                        = 30
  tracing_config {
    mode = "PassThrough"
  }
}
