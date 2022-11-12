resource "aws_efs_mount_target" "EFSMountTargetB" {
  file_system_id = "EFSMountTargetB"
  subnet_id      =""
  security_groups=[]
}
