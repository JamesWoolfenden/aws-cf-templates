resource "aws_route53_record" "RecordSetIPv6" {
  zone_id = ""
  name    = "${var.HostedZoneName}"
  type    = "AAAA"
  multivalue_answer_routing_policy=false
    alias {
      name                  = ""
      evaluate_target_health= false
      zone_id               = ""
    }
}
