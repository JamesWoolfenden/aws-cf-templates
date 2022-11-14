resource "aws_lb" "LoadBalancer" {
  ip_address_type= "dualstack"
 idle_timeout= "60"
 routing.http2.enabled= "true"
 access_logs.s3.enabled= "<nil>"
 