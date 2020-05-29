# Data lookup tp find the hosted zone
data "aws_route53_zone" "training-tio" {
  name         = var.sub_domain
  private_zone = false
}

# Create a data lookup for the name of a VPC in this account using a filter.
# The filter is by the tag "Name" and looks for a value of "denise*"
# where * is a wildcard
# Once the lookup is created than attributes for the VPC can be used in other configuation
data "aws_vpc" "denise-vpc" {
  filter {
    name   = "tag:Name"
    values = ["denise*"]
  }
}

data "aws_subnet" "denise-private" {
  filter {
    name   = "tag:Name"
    values = ["denise-private*"]
  }
}

data "aws_subnet" "denise-public" {
  filter {
    name   = "tag:Name"
    values = ["denise-public*"]
  }
}
