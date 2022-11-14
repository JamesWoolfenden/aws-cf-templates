resource "aws_cloudwatch_log_group" "DrainInstanceLogGroup" {
  name              = "/aws/lambda/"
  retention_in_days = "14"
}
