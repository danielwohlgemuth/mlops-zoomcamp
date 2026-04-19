module "network" {
  source = "./modules/network"

  aws_region = var.aws_region
  my_ip_v4   = var.my_ip_v4
}

module "server" {
  source = "./modules/server"

  key_pair_name = var.key_pair_name
}