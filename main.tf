
module "db_instances" {
  for_each= var.db_instances
  source = "./modules/ec2"
  environment=var.env
  component_name = each.key
  app_port = each.value["app_port"]
  instance_type = each.value["instance_type"]
  vpc_id = each.value["vpc_id"]
  domain_name    = var.domain_name
  zone_id        = var.zone_id
}

module "app_instances" {
  depends_on     = [module.db_instances]
  for_each= var.app_instances
  source = "./modules/ec2"
  environment=var.env
  component_name = each.key
  app_port = each.value["app_port"]
  instance_type = each.value["instance_type"]
  vpc_id = each.value["vpc_id"]
  zone_id        = var.zone_id

}

module "web_instances" {
  depends_on     = [module.app_instances]
  for_each= var.web_instances
  source = "./modules/ec2"
  environment=var.env
  component_name = each.key
  app_port = each.value["app_port"]
  instance_type = each.value["instance_type"]
  vpc_id = each.value["vpc_id"]
  zone_id        = var.zone_id

}