resource "aws_lb_target_group" "LoadBalancerTargetGroup" {
  health_check {
    enabled=false
    interval=15
    matcher="{<nil> 0xc0004e3680   [] map[] }"
    path = "/"
    port = "80"
    protocol="HTTP"
    timeout= 10
    healthy_threshold=2
    unhealthy_threshold= 2
    }
  name= "<nil>"
  port= 80
  protocol= "HTTP"
}
