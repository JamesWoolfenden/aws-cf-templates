resource "aws_security_group_rule" "LoadBalancerSecurityGroupInWorld" {
  type              = "ingress"
  security_group_id = aws_security_group.LoadBalancerSecurityGroup.id
  cidr_blocks=["0.0.0.0/0"]
  from_port=443
  protocol="tcp"
  to_port=443
}
