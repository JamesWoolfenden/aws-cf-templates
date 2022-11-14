resource "aws_iam_role" "ScaleUpLambdaRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"lambda.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "autoscalingZBokzl" {
  name="autoscalingZBokzl"
  role=aws_iam_role.ScaleUpLambdaRole.id
  policy = jsonencode({"Statement":[{"Action":"autoscaling:ExecutePolicy","Effect":"Allow","Resource":"*"}]})
}
