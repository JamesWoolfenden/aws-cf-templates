resource "aws_lb_target_group" "DefaultTargetGroup" {
  health_check {
    enabled   = false
    interval  = 15
    matcher   = "200-299"
    path    = "/v1/metadata"
    port    = "51678"
    protocol =  "HTTP"
    timeout   = 10
    healthy_threshold  = 2
    unhealthy_threshold= 2
  }
  name= "DefaultTargetGroup"
  port    = 80
  protocol= "HTTP"
}
