resource "aws_security_group_rule" "SecurityGroupInSSHWorld" {
  type              = "ingress"
  security_group_id = ""
  cidr_blocks=["0.0.0.0/0"]
  from_port=22
  protocol="tcp"
  to_port=22
}
