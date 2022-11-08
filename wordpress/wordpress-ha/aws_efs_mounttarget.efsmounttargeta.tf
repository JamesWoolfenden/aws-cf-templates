resource "aws_efs_mount_target" "EFSMountTargetA" {
  file_system_id = "EFSMountTargetA"
  subnet_id      =""
  security_groups=[aws_security_group.EFSSecurityGroup.id]
}
