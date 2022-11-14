resource "aws_security_group_rule" "ALBSecurityGroupInHttpsWorldIPv6" {
  type              = "ingress"
  security_group_id = aws_security_group.ALBSecurityGroup.id
  cidr_blocks       = []
  ipv6_cidr_blocks  = ["::/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}
