
data "terraform_remote_state" "resource_group" {
    backend = "azurerm"
    config = {
        resource_group_name = "azure-saas-project-rg"
        storage_account_name = "azuresaasproject"
        container_name = "prod"
        key = "resource_group.tfstate"
    }
}

data "terraform_remote_state" "network" {
    backend = "azurerm"
    config = {
        resource_group_name = "azure-saas-project-rg"
        storage_account_name = "azuresaasproject"
        container_name = "prod"
        key = "vnet.tfstate"
    }
}
data "terraform_remote_state" "log_analytics" {
    backend = "azurerm"
    config = {
        resource_group_name = "azure-saas-project-rg"
        storage_account_name = "azuresaasproject"
        container_name = "prod"
        key = "monitoring.tfstate"
    }
}
data "terraform_remote_state" "appgw" {
    backend = "azurerm"
    config = {
        resource_group_name = "azure-saas-project-rg"
        storage_account_name = "azuresaasproject"
        container_name = "prod"
        key = "appgateway.tfstate"
    }
}
data "azurerm_virtual_network" "prod_vnet" {
  name                = "prod-vnet"
  resource_group_name = "rg-prod"
}
data "azurerm_subnet" "aks" {
  name                 = "aks"
  virtual_network_name = data.azurerm_virtual_network.prod_vnet.name
  resource_group_name  = "rg-prod"
}
