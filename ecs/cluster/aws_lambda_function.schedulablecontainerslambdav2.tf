resource "aws_lambda_function" "SchedulableContainersLambdaV2" {
  function_name = "SchedulableContainersLambdaV2"
  role          = aws_iam_role.SchedulableContainersLambdaRole.arn
  filename      = "SchedulableContainersLambdaV2.zip"
  handler       = "index.handler"
  layers        = []
  memory_size   = 128
  runtime       = "nodejs16.x"
  timeout       = 60
}
