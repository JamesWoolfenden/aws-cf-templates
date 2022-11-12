resource "aws_iam_policy" "IAMPolicySSHAccess" {
  policy=jsonencode({"Statement":[{"Action":["iam:ListUsers"],"Effect":"Allow","Resource":["*"]},{"Action":["iam:ListSSHPublicKeys","iam:GetSSHPublicKey"],"Effect":"Allow","Resource":["arn:aws:iam::123456789012:user/*"]}],"Version":"2012-10-17"})
  name = "iam"
}
resource "aws_iam_role_policy_attachment" "IAMPolicySSHAccess-" {
  role       = ""
  policy_arn = aws_iam_policy.IAMPolicySSHAccess.arn
}
