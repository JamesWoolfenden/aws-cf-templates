resource "aws_iam_role" "ScalableTargetRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"application-autoscaling.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "ecstwoTDZ" {
  name="ecstwoTDZ"
  role=aws_iam_role.ScalableTargetRole.id
  policy = jsonencode({"Statement":[{"Action":["ecs:DescribeServices","ecs:UpdateService"],"Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "cloudwatchtwoTDZ" {
  name="cloudwatchtwoTDZ"
  role=aws_iam_role.ScalableTargetRole.id
  policy = jsonencode({"Statement":[{"Action":["cloudwatch:DescribeAlarms"],"Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"})
}
