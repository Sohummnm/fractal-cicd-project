module "appgw" {
  source = "../../../modules/appgateway"
  appgw_name = var.appgw_name
  sku_name = var.sku_name
  sku_tier = var.sku_tier
  sku_capacity = var.sku_capacity
  backend_ips = var.backend_ips
  agic_identity_name = var.agic_identity_name
  tags = var.tags

}