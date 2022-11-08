resource "aws_iam_role" "BackupRole" {
  force_detach_policies=false
  inline_policy {}
  assume_role_policy = jsonencode({"Statement":[{"Action":"sts:AssumeRole","Effect":"Allow","Principal":{"Service":"backup.amazonaws.com"}}],"Version":"2012-10-17"})
}

resource "aws_iam_role_policy" "backupqADICy" {
  name="backupqADICy"
  role=aws_iam_role.BackupRole.id
  policy = jsonencode({"Statement":[{"Action":["elasticfilesystem:Backup","elasticfilesystem:DescribeTags"],"Effect":"Allow","Resource":"arn::elasticfilesystem:us-east-1:123456789012:file-system/"}],"Version":"2012-10-17"})
}
