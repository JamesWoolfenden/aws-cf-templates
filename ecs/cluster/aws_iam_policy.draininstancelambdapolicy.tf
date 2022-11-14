resource "aws_iam_policy" "DrainInstanceLambdaPolicy" {
  policy = jsonencode({ "Statement" : [{ "Action" : ["logs:CreateLogStream", "logs:PutLogEvents"], "Effect" : "Allow", "Resource" : null }] })
  name   = "lambda"
}
resource "aws_iam_role_policy_attachment" "DrainInstanceLambdaPolicy-" {
  role       = aws_iam_role.DrainInstanceLambdaRole.arn
  policy_arn = aws_iam_policy.DrainInstanceLambdaPolicy.arn
}
