resource "aws_security_group" "SecurityGroup" {
  description = "ecs-cluster"
  name        = "SecurityGroup"
  ingress {
    cidr_blocks=[]
    from_port=0
    protocol="tcp"
    to_port=65535
  }
  vpc_id=""
}
