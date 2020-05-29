# Create a new route 53 record to ensure access via a friendly domain
resource "aws_route53_record" "denise-domain" {
  zone_id = data.aws_route53_zone.training-tio.zone_id
  name    = var.main_domain
  type    = "A"

  alias {
    name                   = aws_elb.denise-elb.dns_name
    zone_id                = aws_elb.denise-elb.zone_id
    evaluate_target_health = true
  }
}
