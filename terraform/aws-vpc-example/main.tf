terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

# Simple VPC + Subnet example (portfolio sample)
resource "aws_vpc" "portfolio_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "portfolio-vpc"
  }
}

resource "aws_subnet" "portfolio_subnet" {
  vpc_id                  = aws_vpc.portfolio_vpc.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "portfolio-subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.portfolio_vpc.id
}

output "subnet_id" {
  value = aws_subnet.portfolio_subnet.id
}
