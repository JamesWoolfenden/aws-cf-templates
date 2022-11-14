resource "aws_iam_policy" "IAMPolicySSHAccess" {
  policy = jsonencode({ "Statement" : [{ "Action" : ["iam:ListUsers"], "Effect" : "Allow", "Resource" : ["*"] }, { "Action" : ["iam:ListSSHPublicKeys", "iam:GetSSHPublicKey"], "Effect" : "Allow", "Resource" : ["arn:aws:iam::123456789012:user/*"] }], "Version" : "2012-10-17" })
  name   = "iam-ssh"
}
resource "aws_iam_role_policy_attachment" "IAMPolicySSHAccess-" {
  role       = aws_iam_role.Role.arn
  policy_arn = aws_iam_policy.IAMPolicySSHAccess.arn
}
