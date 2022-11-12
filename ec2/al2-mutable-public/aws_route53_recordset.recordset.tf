resource "aws_route53_record" "RecordSet" {
  zone_id = ""
  name    = "${var.HostedZoneName}"
  type    = "A"
  ttl     = 60
  records = []
  multivalue_answer_routing_policy=false
}
