resource "aws_lb_listener_rule" "LoadBalancerHttpsListenerRule" {
  listener_arn = ""
  priority     = 1
  action {
    type = "forward"
  }
}
