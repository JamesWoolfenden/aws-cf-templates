resource "aws_security_group" "WebServerSecurityGroup" {
  description = "wordpress-ec2"
  name        = "WebServerSecurityGroup"
  ingress {
    cidr_blocks=[]
    from_port=80
    protocol="tcp"
    to_port=80
  }
  vpc_id=""
}
