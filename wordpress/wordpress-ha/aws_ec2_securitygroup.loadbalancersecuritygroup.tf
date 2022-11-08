resource "aws_security_group" "LoadBalancerSecurityGroup" {
  description = "wordpress-elb"
  name        = "LoadBalancerSecurityGroup"
  vpc_id      = var.vpc_id
}
