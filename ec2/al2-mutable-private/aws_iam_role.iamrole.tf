resource "aws_iam_role" "IAMRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ssmWUKWVR" {
  name="ssmWUKWVR"
  role=aws_iam_role.IAMRole.id
  policy = jsonencode({"Statement":[{"Action":["ssmmessages:*","ssm:UpdateInstanceInformation","ec2messages:*","ssm:GetDeployablePatchSnapshotForInstance","ssm:ListAssociations"],"Effect":"Allow","Resource":"*"},{"Action":"s3:GetObject","Effect":"Allow","Resource":["arn::s3:::aws-ssm-us-east-1/*","arn::s3:::patch-baseline-snapshot-us-east-1/*"]}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "cloudwatchWUKWVR" {
  name="cloudwatchWUKWVR"
  role=aws_iam_role.IAMRole.id
  policy = jsonencode({"Statement":[{"Action":"cloudwatch:PutMetricData","Condition":{"StringEquals":{"cloudwatch:namespace":"goformation-stack"}},"Effect":"Allow","Resource":"*"},{"Action":["logs:CreateLogGroup","logs:CreateLogStream","logs:PutLogEvents","logs:DescribeLogStreams","logs:DescribeLogGroups"],"Effect":"Allow","Resource":null}],"Version":"2012-10-17"})
}
