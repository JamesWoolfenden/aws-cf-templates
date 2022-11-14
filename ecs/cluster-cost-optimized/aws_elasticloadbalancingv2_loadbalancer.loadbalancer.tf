resource "aws_lb" "LoadBalancer" {
  name           = "LoadBalancer"
  internal=false
  security_groups = [""]
  subnets        = []
  enable_http2 = true
  access_logs {
    bucket=""
    enabled = false
  }
}
