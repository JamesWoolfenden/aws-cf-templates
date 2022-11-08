resource "aws_iam_instance_profile" "WebServerInstanceProfile" {
  name = "WebServerInstanceProfile"
  role = aws_iam_role.WebServerIAMRole.name
}
