# module for vnet azure

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group

  tags = var.tags
}

resource "azurerm_subnet" "subnets" {
    for_each = var.subnets
    name = each.key
    resource_group_name = var.vnet_resource_group
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [each.value]
}