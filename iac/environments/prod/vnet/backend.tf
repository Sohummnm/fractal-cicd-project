terraform {
  backend "azurerm" {
    resource_group_name  = "db_terraform_rg"
    storage_account_name = "fractalcicd"
    container_name       = "prod"
    key                  = "vnet.tfstate"
  }
}