resource "aws_iam_role" "WebServerIAMRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"}}],"Version":"2012-10-17"})
}


resource "aws_iam_role_policy" "logshzxdea" {
  name="logshzxdea"
  role=aws_iam_role.WebServerIAMRole.id
  policy = jsonencode({"Statement":[{"Action":["logs:CreateLogGroup","logs:CreateLogStream","logs:PutLogEvents","logs:DescribeLogStreams"],"Effect":"Allow","Resource":null}],"Version":"2012-10-17"})
}
