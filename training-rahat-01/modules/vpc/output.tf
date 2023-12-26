output "public-subnet" {

  description = "Public subnet of vpc"
  value = aws_subnet.public-subnet.id
}