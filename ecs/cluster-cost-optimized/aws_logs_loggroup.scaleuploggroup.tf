resource "aws_cloudwatch_log_group" "ScaleUpLogGroup" {
  name              = "/aws/lambda/"
  retention_in_days = "14"
}
