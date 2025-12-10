
module "acr" {
  source                     = "../../../modules/acr"
  acr_name                   = var.acr_name
  sku                        = var.sku
  tags                       = var.tags
  acr_resource_group_name    = data.terraform_remote_state.resource_group.outputs.rg_name
  acr_resource_group_location = data.terraform_remote_state.resource_group.outputs.rg_location
  aks_principal_id           = data.terraform_remote_state.aks_cluster.outputs.principal_id
}
