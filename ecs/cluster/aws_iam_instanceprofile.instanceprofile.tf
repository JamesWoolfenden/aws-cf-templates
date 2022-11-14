resource "aws_iam_instance_profile" "InstanceProfile" {
  name = "InstanceProfile"
  role = aws_iam_role.Role.arn
}
