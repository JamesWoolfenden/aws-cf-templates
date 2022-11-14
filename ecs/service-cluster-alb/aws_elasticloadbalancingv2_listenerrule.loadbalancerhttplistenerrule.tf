resource "aws_lb_listener_rule" "LoadBalancerHttpListenerRule" {
  listener_arn = ""
  priority     = 1
  action {
    type = "forward"
  }
}
