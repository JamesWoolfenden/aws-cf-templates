resource "aws_security_group_rule" "SecurityGroupInSSHBastion" {
  type              = "ingress"
  security_group_id = ""
  cidr_blocks=[]
  from_port=22
  protocol="tcp"
  to_port=22
}