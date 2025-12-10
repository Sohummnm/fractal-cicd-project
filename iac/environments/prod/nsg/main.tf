module "nsg" {
  source = "../../../modules/nsg"

  nsgs                        = var.nsgs
  nsg_resource_group_name      = data.terraform_remote_state.resource_group.outputs.rg_name
  nsg_resource_group_location  = data.terraform_remote_state.resource_group.outputs.rg_location
  tags                         = var.tags

  subnet_associations = {
    aks    = { subnet_id = data.terraform_remote_state.vnet.outputs.subnet_ids["aks"], nsg_name = "aks" }
    appgw  = { subnet_id = data.terraform_remote_state.vnet.outputs.subnet_ids["appgw"], nsg_name = "appgw" }
    db     = { subnet_id = data.terraform_remote_state.vnet.outputs.subnet_ids["db"], nsg_name = "db" }
  }

  aks_rules   = var.aks_rules
  appgw_rules = var.appgw_rules
  db_rules    = var.db_rules
}