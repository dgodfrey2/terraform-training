# Create a new VPC
resource "aws_vpc" "denise-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name          = var.vpc_name
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create a new private subnet
resource "aws_subnet" "denise-private-subnet" {
  vpc_id            = aws_vpc.denise-vpc.id
  cidr_block        = var.vpc_cidr_private_subnet
  availability_zone = var.availability_zone

  tags = {
    Name          = join("-", [var.tag_owner, "private-sn", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create a new public subnet
resource "aws_subnet" "denise-public-subnet" {
  vpc_id            = aws_vpc.denise-vpc.id
  cidr_block        = var.vpc_cidr_public_subnet
  availability_zone = var.availability_zone

  tags = {
    Name          = join("-", [var.tag_owner, "public-sn", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "denise-ig" {
  vpc_id = aws_vpc.denise-vpc.id

  tags = {
    Name          = join("-", [var.vpc_name, "ig", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Create a new routing table for public subnet
resource "aws_route_table" "denise-public-sn-rt" {
  vpc_id = aws_vpc.denise-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.denise-ig.id
  }

  tags = {
    Name          = join("-", [var.vpc_name, "public-sn-rt", ], )
    Owner         = var.tag_owner
    Orchestration = var.tag_orchestration
  }
}

# Associate the routing table to public subnet
resource "aws_route_table_association" "denise-public-sn-rt-assn" {
  subnet_id      = aws_subnet.denise-public-subnet.id
  route_table_id = aws_route_table.denise-public-sn-rt.id
}
