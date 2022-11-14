resource "aws_security_group_rule" "SecurityGroupIngressTcpPort1" {
  type              = "ingress"
  security_group_id = ""
  cidr_blocks=[]
  from_port=0
  protocol="tcp"
  to_port=0
}
