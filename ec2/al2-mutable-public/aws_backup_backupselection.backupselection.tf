resource "aws_backup_selection" "BackupSelection" {
  iam_role_arn = ""
  name         = "goformation-stack"
  plan_id      = ""
  resources=[
	"arn::ec2:us-east-1:123456789012:instance/"
	]

}
