resource "aws_elb" "LoadBalancer" {
  name= "LoadBalancer"
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 5
  }
  instances                   = []
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining= true
  connection_draining_timeout=30
  
  listener {
    instance_port    = 80
    instance_protocol= "HTTP"
    lb_port          = 443
    lb_protocol      = "HTTPS"
    ssl_certificate_id=var.ElbAcmCertificate
  }
  security_groups=[
    aws_security_group.LoadBalancerSecurityGroup.id]
  subnets=[ ]
}