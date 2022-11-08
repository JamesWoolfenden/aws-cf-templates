resource "aws_backup_selection" "BackupSelection" {
  iam_role_arn = aws_iam_role.BackupRole.arn
  name         = "goformation-stack"
  plan_id      = aws_backup_plan.BackupPlan.id
  resources=[
  "${aws_efs_file_system.EFSFileSystem.arn}/"
	]

}
