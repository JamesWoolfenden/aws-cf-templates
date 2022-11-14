resource "aws_lambda_permission" "ScaleUpLambdaPermission" {
  action="lambda:InvokeFunction"
  function_name=aws_lambda_function.ScaleUpLambda.function_name
  principal="events.amazonaws.com"
}
