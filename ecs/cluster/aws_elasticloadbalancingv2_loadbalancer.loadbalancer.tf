resource "aws_lb" "LoadBalancer" {
  name           = "LoadBalancer"
  internal=false
  security_groups = [""]
  subnets        = []
  http_enabled=true
  access_logs {
    enabled = false
  }
}
