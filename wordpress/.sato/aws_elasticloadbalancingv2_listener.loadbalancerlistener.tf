resource "aws_lb_listener" "LoadBalancerListener" {
  certificate_arn  = "<nil>"
  load_balancer_arn= ""
  port             = "443"
  protocol         = "HTTPS"
  ssl_policy       = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
  default_action {
    type ="forward"
  }
}
