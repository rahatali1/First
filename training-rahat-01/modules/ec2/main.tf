data "aws_ami" "default" {
  most_recent = true
  filter {
    name   = "name"
    values = ["*ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-**"]
  }
}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  public_key = tls_private_key.example.public_key_openssh
}
resource "aws_instance" "default" {
  ami           = data.aws_ami.default.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.generated_key.public_key
  
  # root disk
  root_block_device {
    volume_size           = var.volume_size_root
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.volume_size_ebs
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }

}