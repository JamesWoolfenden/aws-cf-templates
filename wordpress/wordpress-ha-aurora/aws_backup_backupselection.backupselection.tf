resource "aws_backup_selection" "BackupSelection" {
  iam_role_arn = ""
  name         = "goformation-stack"
  plan_id      = ""
  resources=[
	"arn::elasticfilesystem:us-east-1:123456789012:file-system/"
	]

}
