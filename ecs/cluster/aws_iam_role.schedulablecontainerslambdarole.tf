resource "aws_iam_role" "SchedulableContainersLambdaRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"lambda.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ecsYEWEut" {
  name="ecsYEWEut"
  role=aws_iam_role.SchedulableContainersLambdaRole.id
  policy = jsonencode({"Statement":[{"Action":"ecs:ListContainerInstances","Effect":"Allow","Resource":"arn:aws:ecs:us-east-1:123456789012:cluster/"},{"Action":"ecs:DescribeContainerInstances","Condition":{"ArnEquals":{"ecs:cluster":"arn:aws:ecs:us-east-1:123456789012:cluster/"}},"Effect":"Allow","Resource":"*"}]})
}

resource "aws_iam_role_policy" "cloudwatchYEWEut" {
  name="cloudwatchYEWEut"
  role=aws_iam_role.SchedulableContainersLambdaRole.id
  policy = jsonencode({"Statement":[{"Action":"cloudwatch:PutMetricData","Effect":"Allow","Resource":"*"}]})
}
