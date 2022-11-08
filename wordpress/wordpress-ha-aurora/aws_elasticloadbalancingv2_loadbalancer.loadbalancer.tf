resource "aws_lb" "LoadBalancer" {
  ip_address_type= "dualstack"
  name           = "LoadBalancer"
  internal=false
  security_groups = [""]
  subnets        = ["", "", ""]
  http_enabled=true
  access_logs {
    enabled = false
  }
}
