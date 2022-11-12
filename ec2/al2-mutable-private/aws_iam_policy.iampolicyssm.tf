resource "aws_iam_policy" "IAMPolicySSM" {
  policy=jsonencode({"Statement":[{"Action":"ssm:ListInstanceAssociations","Effect":"Allow","Resource":"arn::ec2:us-east-1:123456789012:instance/"},{"Action":"ssm:PutInventory","Effect":"Allow","Resource":["arn::ec2:us-east-1:123456789012:instance/","arn::ssm:us-east-1:123456789012:managed-instance-inventory/"]},{"Action":"ssm:UpdateInstanceAssociationStatus","Effect":"Allow","Resource":["arn::ec2:us-east-1:123456789012:instance/","arn::ssm:us-east-1:123456789012:association/"]}],"Version":"2012-10-17"})
  name = "ssm2"
}
resource "aws_iam_role_policy_attachment" "IAMPolicySSM-" {
  role       = ""
  policy_arn = aws_iam_policy.IAMPolicySSM.arn
}
