resource "aws_efs_mount_target" "EFSMountTargetC" {
  file_system_id = "EFSMountTargetC"
  subnet_id      =""
  security_groups=[]
}
