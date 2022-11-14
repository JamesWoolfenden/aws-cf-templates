resource "aws_lambda_permission" "SchedulableContainersLambdaPermission2" {
  action="lambda:InvokeFunction"
  function_name=""
  principal="events.amazonaws.com"
}
