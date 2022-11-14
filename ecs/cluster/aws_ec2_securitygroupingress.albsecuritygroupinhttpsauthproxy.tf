resource "aws_security_group_rule" "ALBSecurityGroupInHttpsAuthProxy" {
  type              = "ingress"
  security_group_id = aws_security_group.ALBSecurityGroup.id
  cidr_blocks       = []
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}
