resource "aws_security_group" "WebServerSecurityGroup" {
  description = "wordpress-ec2"
  name        = "WebServerSecurityGroup"
  ingress {
    description = "wordpress"
    cidr_blocks = []
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    security_groups = [aws_security_group.LoadBalancerSecurityGroup.id]
  }
  vpc_id = var.vpc_id
}
