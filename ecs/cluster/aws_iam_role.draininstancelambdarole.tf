resource "aws_iam_role" "DrainInstanceLambdaRole" {
  force_detach_policies = false
  inline_policy {}
  assume_role_policy = jsonencode({ "Statement" : [{ "Action" : "sts:AssumeRole", "Effect" : "Allow", "Principal" : { "Service" : "lambda.amazonaws.com" } }], "Version" : "2012-10-17" })
}

resource "aws_iam_role_policy" "draininstancebDrOPP" {
  name   = "draininstancebDrOPP"
  role   = aws_iam_role.DrainInstanceLambdaRole.id
  policy = jsonencode({ "Statement" : [{ "Action" : ["sqs:DeleteMessage", "sqs:ReceiveMessage", "sqs:SendMessage", "sqs:GetQueueAttributes"], "Effect" : "Allow", "Resource" : null }, { "Action" : ["ecs:ListContainerInstances"], "Effect" : "Allow", "Resource" : null }, { "Action" : ["ecs:updateContainerInstancesState", "ecs:listTasks"], "Condition" : { "StringEquals" : { "ecs:cluster" : null } }, "Effect" : "Allow", "Resource" : "*" }, { "Action" : ["autoscaling:CompleteLifecycleAction", "autoscaling:RecordLifecycleActionHeartbeat"], "Effect" : "Allow", "Resource" : "arn::autoscaling:us-east-1:123456789012:autoScalingGroup:*:autoScalingGroupName/" }] })
}
