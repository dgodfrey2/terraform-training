# Create a new classic load balancer
resource "aws_elb" "denise-elb" {
  name                      = join("-", [var.tag_owner, "elb", ], )
  subnets                   = [data.aws_subnet.denise-public.id]
  security_groups           = [aws_security_group.denise-elb-sg.id]
  cross_zone_load_balancing = "true"

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = var.server_port
    instance_protocol = "http"
  }

  listener {
    lb_port           = 443
    lb_protocol       = "https"
    instance_port     = var.server_port
    instance_protocol = "http"

    ssl_certificate_id = aws_acm_certificate.denise-cert.arn
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = join("", ["HTTP:", var.server_port, "/", ], )
    interval            = 30
  }

  instances = [aws_instance.denise-training.id]

  tags = {
    Name          = join("-", [var.tag_owner, "elb", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}
