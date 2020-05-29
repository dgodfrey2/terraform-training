# Create a new instance
resource "aws_instance" "denise-training" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.denise-private.id
  vpc_security_group_ids = [aws_security_group.denise-sg.id]

  user_data = <<-EOF
            #!/bin/bash
            echo "Hello world! This was created by Terraform on port ${var.server_port} at ${timestamp()}" > index.html
            nohup busybox httpd -f -h / -p "${var.server_port}" &
            EOF

  tags = {
    Name          = join("-", [var.tag_owner, "training", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
    "cpm backup"  = "no-backup"
  }
}
