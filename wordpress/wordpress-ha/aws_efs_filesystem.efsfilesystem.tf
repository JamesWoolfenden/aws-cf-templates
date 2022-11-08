resource "aws_efs_file_system" "EFSFileSystem" {
  encrypted        = true
  kms_key_id       = ""
  performance_mode = "generalPurpose"
}