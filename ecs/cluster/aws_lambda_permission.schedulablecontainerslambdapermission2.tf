resource "aws_lambda_permission" "SchedulableContainersLambdaPermission2" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.SchedulableContainersLambdaV2.arn
  principal     = "events.amazonaws.com"
}
