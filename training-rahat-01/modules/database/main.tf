resource "random_password" "password" {
  length           = 10
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "aws_db_instance" "default" {
  allocated_storage = var.allocated_storage
  # db_name              = "mydb"
  engine = var.engine
  # engine_version       = "5.7"
  instance_class = var.instance_class
  username       = var.username
  password       = random_password.password.result
  # parameter_group_name = "default.mysql5.7"
  # skip_final_snapshot  = true
}