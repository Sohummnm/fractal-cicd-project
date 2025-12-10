resource "azurerm_log_analytics_workspace" "monitoring" {
  name                = var.workspace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.workspace_sku
  retention_in_days   = var.retention_in_days

  tags = var.tags
}
