resource "aws_sqs_queue" "AutoScalingGroupLifecycleHookQueue" {
  name                        = "goformation-stack-lifecycle-hook"
  redrive_policy              = jsonencode({ "deadLetterTargetArn" : null, "maxReceiveCount" : 5 })
  content_based_deduplication = false
  visibility_timeout_seconds  = 60
}
