resource "aws_iam_policy" "SchedulableContainersLambdaPolicy" {
  policy=jsonencode({"Statement":[{"Action":["logs:CreateLogStream","logs:PutLogEvents"],"Effect":"Allow","Resource":null}]})
  name = "lambda"
}
resource "aws_iam_role_policy_attachment" "SchedulableContainersLambdaPolicy-" {
  role       = ""
  policy_arn = aws_iam_policy.SchedulableContainersLambdaPolicy.arn
}
