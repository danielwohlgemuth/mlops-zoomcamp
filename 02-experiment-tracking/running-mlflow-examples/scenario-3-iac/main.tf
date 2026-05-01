module "storage" {
  source = "./modules/storage"

  aws_region = var.aws_region
}

module "network" {
  source = "./modules/network"

  aws_region = var.aws_region
  my_ip_v4   = var.my_ip_v4
  s3_arn            = module.storage.s3_arn
}

module "server" {
  source = "./modules/server"

  key_pair_name     = var.key_pair_name
  vpc_subnet_id     = module.network.vpc_subnet_id
  vpc_endpoint_id   = module.network.vpc_endpoint_id
  security_group_id = module.network.security_group_id
}