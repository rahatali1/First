resource "aws_lb" "app-load-balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  # security_groups    = [aws_security_group.lb_sg.id]
  # subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  # access_logs {
  #   bucket  = example.lb_logs.id
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  # tags = {
  #   Environment = "production"
  # }
}