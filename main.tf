module "vpc" {
  for_each= var.vpc
  source = "./modules/vpc"
  env = var.env
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]
  default_vpc =  var.default_vpc
}




module "db_instances" {
  for_each= var.db_instances
  source = "./modules/ec2"
  environment=var.env
  component_name = each.key
  app_port = each.value["app_port"]
  instance_type = each.value["instance_type"]
  allow_cidr = each.value["allow_cidr"]
  # vpc_id = each.value["vpc_id"]
  domain_name    = var.domain_name
  zone_id        = var.zone_id
  vault_token = var.vault_token
  volume_size = each.value["volume_size"]
  vpc_id         = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
  subnet_id      = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), "db-subnet-1", null), "id", null)
  # subnet_id = module.vpc.db_subnets[0]
  bastion_nodes = var.bastion_nodes
}

# module "app_instances" {
#   depends_on     = [module.db_instances]
#   for_each= var.app_instances
#   source = "./modules/ec2"
#   environment=var.env
#   component_name = each.key
#   app_port = each.value["app_port"]
#   instance_type = each.value["instance_type"]
#   # vpc_id = each.value["vpc_id"]
#   zone_id        = var.zone_id
#   domain_name = var.domain_name
#   vault_token = var.vault_token
#   volume_size = each.value["volume_size"]
# }
#
# module "web_instances" {
#   depends_on     = [module.app_instances]
#   for_each= var.web_instances
#   source = "./modules/ec2"
#   environment=var.env
#   component_name = each.key
#   app_port = each.value["app_port"]
#   instance_type = each.value["instance_type"]
#   # vpc_id = each.value["vpc_id"]
#   domain_name = var.domain_name
#   zone_id        = var.zone_id
#   vault_token = var.vault_token
#   volume_size = each.value["volume_size"]
# }

module "eks" {
  source = "./modules/eks"
  env=var.env
  # subnet_ids = var.eks["subnet_ids"]
  addons = var.eks["addons"]
  node_groups = var.eks["node_groups"]
  access_entries = var.eks["access_entries"]
  vpc_id         = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
  subnet_ids     = lookup(lookup(module.vpc, "main", null), "app_subnets", null)
}

# output "aut"  {
#   value = module.eks
# }

output "vpc_id" {
  value = lookup(module.vpc, "main", null)
}