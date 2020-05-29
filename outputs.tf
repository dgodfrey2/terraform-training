# Instance
#########################################
output "instance_public_ip" {
  value       = aws_instance.denise-training.public_ip
  description = "The public IP of the web server"
}

output "instance_private_ip" {
  value       = aws_instance.denise-training.private_ip
  description = "The private IP of the web server"
}

output "instance_id" {
  value       = aws_instance.denise-training.id
  description = "List of IDs of instances"
}

# ELB
#########################################
output "elb_id" {
  value       = aws_elb.denise-elb.id
  description = "The ID of the ELB"
}

output "elb_dns_name" {
  value       = aws_elb.denise-elb.dns_name
  description = "The DNS name of the ELB"
}

# VPC
#########################################
output "vpc_id" {
  value       = data.aws_vpc.denise-vpc.id
  description = "The ID of the training VPC"
}

output "subnet_private_id" {
  value       = data.aws_subnet.denise-private.id
  description = "The ID of the private subnet"
}

output "subnet_public_id" {
  value       = data.aws_subnet.denise-public.id
  description = "The ID of the public subnet"
}
