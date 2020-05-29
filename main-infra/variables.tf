# Global Variables
#########################################
variable "tag_owner" {
  description = "Enter your name in this variable as a single block"
  default     = "denise"
}

variable "tag_orchestration" {
  description = "Enter the github address for this repo"
  default     = "git@github.com:dgodfrey2/terraform-training.git"
}

# VPC
#########################################
variable "vpc_name" {
  description = "The VPC name"
  default     = "denise-vpc"
}

variable "vpc_cidr_block" {
  description = "The VPC Cidr Block"
  default     = "10.0.0.0/16"
}

variable "vpc_cidr_public_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.0.11.0/24"
}

variable "vpc_cidr_private_subnet" {
  description = "CIDR block for the private subnet"
  default     = "10.0.10.0/24"
}

variable "availability_zone" {
  description = "Availability zone to create subnet in"
  default     = "eu-west-1a"
}
