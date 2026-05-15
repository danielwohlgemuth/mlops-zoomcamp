module "storage" {
  source = "./modules/storage"

  aws_region = var.aws_region
}

module "network" {
  source = "./modules/network"

  aws_region = var.aws_region
  name       = var.name
  my_ip_v4   = var.my_ip_v4
  s3_arn     = module.storage.s3_arn
}

module "server" {
  source = "./modules/server"

  key_pair_name     = var.key_pair_name
  server_ami_id     = var.server_ami_id
  vpc_subnet_id     = module.network.vpc_subnet_id_1
  vpc_endpoint_id   = module.network.vpc_endpoint_id
  security_group_id = module.network.security_group_id
}

module "database" {
  source = "./modules/database"

  db_name           = var.db_name
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_username       = var.db_username
  db_password       = var.db_password
  vpc_subnet_id_1   = module.network.vpc_subnet_id_1
  vpc_subnet_id_2   = module.network.vpc_subnet_id_2
  security_group_id = module.network.security_group_id
}
