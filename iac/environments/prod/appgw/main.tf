module "appgw" {
  source                 = "../../../modules/appgateway"
  appgw_name             = var.appgw_name
  resource_group_name    = data.terraform_remote_state.resource_group.outputs.rg_name
  resource_group_location = data.terraform_remote_state.resource_group.outputs.rg_location
  subnet_id              = data.terraform_remote_state.vnet.outputs.subnet_ids["appgw"]
  public_ip_id           = data.terraform_remote_state.pip.outputs.public_ip_id
  sku_name               = var.sku_name
  sku_tier               = var.sku_tier
  sku_capacity           = var.sku_capacity
  backend_ips            = var.backend_ips
  tags                   = var.tags
}