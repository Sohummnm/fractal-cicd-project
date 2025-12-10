module "nsg" {
  source = "../../../modules/nsg"
  nsgs = var.nsgs
  aks_rules = var.aks_rules
  appgw_rules = var.appgw_rules
  db_rules = var.db_rules
  tags = var.tags
}