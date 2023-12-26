resource "aws_vpc" "default" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.default.id
  cidr_block = var.cidr_block_public
}

resource "aws_subnet" "private-subnet" {
 vpc_id     = aws_vpc.default.id
 cidr_block = var.cidr_block_private
}

resource "aws_internet_gateway" "default" {
  vpc_id     = aws_vpc.default.id
}

resource "aws_route_table" "default" {
    vpc_id     = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

}

resource "aws_eip" "default" {
  domain = "vpc"
}

resource "aws_nat_gateway" "tftask1-nat-gateway" {
  allocation_id = aws_eip.default.id
  subnet_id     = aws_subnet.public-subnet.id
}