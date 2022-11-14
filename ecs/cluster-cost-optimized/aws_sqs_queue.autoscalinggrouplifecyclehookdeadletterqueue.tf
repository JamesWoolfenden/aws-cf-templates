resource "aws_sqs_queue" "AutoScalingGroupLifecycleHookDeadLetterQueue" {
  name                      = "goformation-stack-lifecycle-hook-dlq"
  content_based_deduplication = false
}
