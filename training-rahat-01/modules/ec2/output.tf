output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.default.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.default.public_ip
}
output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}