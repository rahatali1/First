module "database" {
  source = "./modules/database" 
  allocated_storage = 10
  engine = "mysql"
  instance_class = "db.t3.micro"
  username = "rahat"
}
module "vpc" {
  source = "./modules/vpc"
  cidr_block_vpc = "10.0.0.0/16"
  cidr_block_public= "10.0.0.0/24"
  cidr_block_private = "10.0.1.0/24"
  instance_tenancy = "default"
}

module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t3.micro"
  subnet_id= module.vpc.public-subnet
  volume_size_root = "20"
  volume_size_ebs = "50"
 }
module "alb" {
  source = "./modules/alb"
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = true
}
