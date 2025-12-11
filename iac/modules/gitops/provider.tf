terraform {
    required_version = ">= 1.6.0, < 2.0.0"
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.55.0"
      }
      azapi = {
        source = "azure/azapi"
        version = "1.14.0"
      }
    }
}

