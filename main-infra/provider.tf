provider "aws" {
  region  = "eu-west-1"
  profile = "aws-bts-training"
}

terraform {
  required_version = ">= 0.12.0"
}
