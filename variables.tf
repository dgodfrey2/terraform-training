# Global
#########################################
variable "tag_owner" {
  description = "Enter your name in this variable as a single block"
  default     = "denise"
}

variable "tag_orchestration" {
  description = "Enter the github address for this repo"
  default     = "git@github.com:dgodfrey2/terraform-training.git"
}

variable "elsevier_cidr_blocks" {
  description = "List of CIDR blocks representing Elsevier internal addresses"
  default     = "10.0.0.0/8,138.12.0.0/16,145.36.0.0/16,172.28.0.0/15,192.168.0.0/16,198.176.80.0/20,198.176.10.0/21,198.185.16.0/21,198.185.24.0/23"
}

# Instance
#########################################
variable "instance_ami" {
  description = "The AMI to be used for the EC2 instance"
  default     = "ami-0701e7be9b2a77600" #Ubuntu Server 18.04 LTS
}

variable "instance_type" {
  description = "The instance type (t2.micro, t2.large etc)"
  default     = "t2.micro"
}

variable "server_port" {
  description = "The port the server will use for requests from the ELB"
  default     = "8080"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  default     = "eu-west-1c"
}

# Route53
#########################################
variable "sub_domain" {
  description = "The subdomain for the project"
  default     = "training.tio.systems"
}

variable "main_domain" {
  description = "The subdomain for the project"
  default     = "denise"
}
