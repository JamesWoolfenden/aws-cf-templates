resource "aws_lb" "LoadBalancer" {
  name           = "LoadBalancer"
  internal=false
  security_groups = [""]
  subnets        = []
  idle_timeout=60
  http_enabled=true
  access_logs {
    enabled = false
  }
}
