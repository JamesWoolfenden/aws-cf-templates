resource "aws_iam_role" "AutoScalingGroupLifecycleHookIAMRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"autoscaling.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "sqsXiwKRd" {
  name="sqsXiwKRd"
  role=aws_iam_role.AutoScalingGroupLifecycleHookIAMRole.id
  policy = jsonencode({"Statement":[{"Action":["sqs:SendMessage","sqs:GetQueueUrl"],"Effect":"Allow","Resource":null,"Sid":"write"}],"Version":"2012-10-17"})
}
