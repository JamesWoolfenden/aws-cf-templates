resource "aws_iam_policy" "WebServerIAMPolicySSHAccess" {
  policy=jsonencode({"Statement":[{"Action":["iam:ListUsers"],"Effect":"Allow","Resource":["*"]},{"Action":["iam:ListSSHPublicKeys","iam:GetSSHPublicKey"],"Effect":"Allow","Resource":["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/*"]}],"Version":"2012-10-17"})
  name = "iam"
}
resource "aws_iam_role_policy_attachment" "WebServerIAMPolicySSHAccess-" {
  role       = aws_iam_role.WebServerIAMRole.name
  policy_arn = aws_iam_policy.WebServerIAMPolicySSHAccess.arn
}
