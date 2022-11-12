resource "aws_lb_listener" "HttpListener" {
  load_balancer_arn= ""
  port             = "80"
  protocol         = "HTTP"
  default_action {
    type ="forward"
  }
}
