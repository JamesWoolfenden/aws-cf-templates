resource "aws_cloudwatch_log_group" "WebServerLogs" {
  retention_in_days = "14"
}
