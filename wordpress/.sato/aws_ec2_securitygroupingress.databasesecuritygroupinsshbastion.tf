resource "aws_security_group_rule" "DatabaseSecurityGroupInSSHBastion" {
  type              = "ingress"
  security_group_id = ""
  cidr_blocks=[]
  from_port=3306
  protocol="tcp"
  to_port=3306
}
