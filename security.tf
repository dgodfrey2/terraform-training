# Create a new security group for my instance
resource "aws_security_group" "denise-sg" {
  name        = join("-", [var.tag_owner, "sg", ], )
  description = "Allow SSH/ELB access to EC2"
  vpc_id      = data.aws_vpc.denise-vpc.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.denise-vpc.cidr_block]
  }

  ingress {
    description = "ELB Access"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = [data.aws_subnet.denise-public.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = join("-", [var.tag_owner, "sg", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create a new security group for my elb
resource "aws_security_group" "denise-elb-sg" {
  name        = join("-", [var.tag_owner, "elb-sg", ], )
  description = "Allow HTTP/HTTPS access to my ELB"
  vpc_id      = data.aws_vpc.denise-vpc.id

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name          = join("-", [var.tag_owner, "elb-sg", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}
