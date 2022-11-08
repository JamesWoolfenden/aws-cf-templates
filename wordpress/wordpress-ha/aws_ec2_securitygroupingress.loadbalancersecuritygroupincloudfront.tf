resource "aws_security_group_rule" "LoadBalancerSecurityGroupInCloudFront" {
  type              = "ingress"
  security_group_id = aws_security_group.LoadBalancerSecurityGroup.id
  cidr_blocks=[]
  prefix_list_ids=["pl-3b927c52"]
  from_port=443
  protocol="tcp"
  to_port=443
}
