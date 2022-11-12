resource "aws_security_group" "EFSSecurityGroup" {
  description = "Allowing access to EFS"
  name        = "EFSSecurityGroup"
  ingress {
    cidr_blocks=[]
    from_port=2049
    protocol="tcp"
    to_port=2049
  }
  vpc_id=""
}
