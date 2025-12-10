
resource "azurerm_public_ip" "prod_appgw_pip" {
  name = var.public_ip_name
  resource_group_name = var.pip_resource_group_name
  location = var.pip_resource_group_location
  sku = "Standard"
  allocation_method = "Static"
  tags = var.tags
}