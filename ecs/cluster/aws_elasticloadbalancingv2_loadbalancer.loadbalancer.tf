resource "aws_lb" "LoadBalancer" {
  name            = "LoadBalancer"
  internal        = false
  security_groups = [aws_security_group.ALBSecurityGroup.name]
  subnets         = []
  enable_http2    = true
  access_logs {
    bucket  = var.logging_bucket
    enabled = true
  }
  enable_deletion_protection = true
  drop_invalid_header_fields = true
}



variable "logging_bucket" {
  type = string
  description = "(optional) describe your variable"
  default="myloggingbucket"
}