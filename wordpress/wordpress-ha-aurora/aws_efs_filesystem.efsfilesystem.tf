resource "aws_efs_file_system" "EFSFileSystem" {
  encrypted        = false
  kms_key_id       = ""
  performance_mode = ""
}
