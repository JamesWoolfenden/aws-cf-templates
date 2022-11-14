resource "aws_security_group_rule" "ALBSecurityGroupInHttpWorld" {
  type              = "ingress"
  security_group_id = aws_security_group.ALBSecurityGroup.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}
