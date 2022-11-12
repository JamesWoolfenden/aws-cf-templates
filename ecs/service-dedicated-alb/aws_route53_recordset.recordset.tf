resource "aws_route53_record" "RecordSet" {
  zone_id = ""
  name    = "${var.HostedZoneName}"
  type    = "A"
  multivalue_answer_routing_policy=false
    alias {
      name                  = ""
      evaluate_target_health= false
      zone_id               = ""
    }
}
