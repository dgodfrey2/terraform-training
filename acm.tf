# Create the SSL Certificate for the planned domain name
resource "aws_acm_certificate" "denise-cert" {
  domain_name       = join(".", [var.main_domain, var.sub_domain, ], )
  validation_method = "DNS"

  tags = {
    Name          = join("-", [var.tag_owner, "cert", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create a Route53 record entry for the certificate in the private hosted zone
resource "aws_route53_record" "denise-cert-record" {
  name = aws_acm_certificate.denise-cert.domain_validation_options.0.resource_record_name
  type = aws_acm_certificate.denise-cert.domain_validation_options.0.resource_record_type

  zone_id = data.aws_route53_zone.training-tio.zone_id
  records = [aws_acm_certificate.denise-cert.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

# Validate the certificate against the Route53 record entry for the certificate
resource "aws_acm_certificate_validation" "denise-cert-validation" {
  certificate_arn         = aws_acm_certificate.denise-cert.arn
  validation_record_fqdns = [aws_route53_record.denise-cert-record.fqdn]
}
