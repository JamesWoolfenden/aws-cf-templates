resource "aws_route53_record" "RecordSet" {
  zone_id = ""
  name    = "www.${var.HostedZoneName}"
  type    = "A"
  multivalue_answer_routing_policy=false
    alias {
      name                  = ""
      evaluate_target_health= false
      zone_id               = "Z2FDTNDATAQYW2"
    }
}
