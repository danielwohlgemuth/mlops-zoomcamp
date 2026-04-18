module "server" {
  source = "./modules/server"

  key_pair_name = var.key_pair_name
}