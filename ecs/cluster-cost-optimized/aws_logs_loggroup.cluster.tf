resource "aws_cloudwatch_log_group" "Cluster" {
  retention_in_days = "14"
}
