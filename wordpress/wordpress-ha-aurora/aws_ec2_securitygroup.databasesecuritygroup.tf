resource "aws_security_group" "DatabaseSecurityGroup" {
  description = "wordpress-rds"
  name        = "DatabaseSecurityGroup"
  ingress {
    cidr_blocks = []
    from_port   = 3306
    protocol    = "tcp"
    to_port     = 3306
  }
  vpc_id = var.vpc_id
}
