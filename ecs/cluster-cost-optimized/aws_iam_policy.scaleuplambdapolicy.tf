resource "aws_iam_policy" "ScaleUpLambdaPolicy" {
  policy=jsonencode({"Statement":[{"Action":["logs:CreateLogStream","logs:PutLogEvents"],"Effect":"Allow","Resource":null}]})
  name = "lambda"
}
resource "aws_iam_role_policy_attachment" "ScaleUpLambdaPolicy-" {
  role       = ""
  policy_arn = aws_iam_policy.ScaleUpLambdaPolicy.arn
}
