resource "aws_cloudwatch_log_group" "SchedulableContainersLogGroup" {
  name              = "/aws/lambda/"
  retention_in_days = "14"
}
