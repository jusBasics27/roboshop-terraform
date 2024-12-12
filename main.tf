
module "db_instances" {
  for_each= var.db_instances
  source = "./modules/ec2"
  environment=var.env
  component_name = each.key
  app_port = each.value["app_port"]
  instance_type = each.value["instance_type"]
  # vpc_id = each.value["vpc_id"]
  domain_name    = var.domain_name
  zone_id        = var.zone_id
  vault_token = var.vault_token
  volume_size = each.value["volume_size"]
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
  subnet_ids = var.eks["subnet_ids"]
  addons = var.eks["addons"]
}

# output "aut"  {
#   value = module.eks
# }