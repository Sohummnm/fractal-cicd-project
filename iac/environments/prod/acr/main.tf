data "terraform_remote_state" "resource_group" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azure-saas-project-rg"
    storage_account_name = "azuresaasproject"
    container_name       = "prod"
    key                   = "resource_group.tfstate"
  }
}

data "terraform_remote_state" "aks_cluster" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azure-saas-project-rg"
    storage_account_name = "azuresaasproject"
    container_name       = "prod"
    key                   = "aks.tfstate"
  }
}

module "acr" {
  source                     = "../../../modules/acr"
  acr_name                   = var.acr_name
  sku                        = var.sku
  tags                       = var.tags
  acr_resource_group_name    = data.terraform_remote_state.resource_group.outputs.rg_name
  acr_resource_group_location = data.terraform_remote_state.resource_group.outputs.rg_location
  aks_principal_id           = data.terraform_remote_state.aks_cluster.outputs.principal_id
}
