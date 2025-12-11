# tfsec:ignore:ALL Reason: Using api_server_access_profile in provider v4.0 & CHECKSUM ERROR
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  service_mesh_profile {
    mode                            = "Istio"
    revisions                       = ["asm-1-26"]
    external_ingress_gateway_enabled = false
    internal_ingress_gateway_enabled = false
  }

  ingress_application_gateway {
    gateway_id = var.appgw_id
  }

  default_node_pool {
    name                = "system"
    node_count          = var.node_count
    vm_size             = var.vm_size
    auto_scaling_enabled = true
    min_count           = var.min_count
    max_count           = var.max_count
    vnet_subnet_id      = var.aks_subnet_ids
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  tags                              = var.tags
}

resource "azurerm_role_assignment" "agic_appgw_contrib" {
  scope                = var.appgw_id
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "Contributor"
}

resource "azurerm_role_assignment" "agic_rg_reader" {
  scope                = var.resource_group_id
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "Reader"
}

resource "azurerm_role_assignment" "agic_subnet_network" {
  scope                = var.appgw_subnet_id
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "Network Contributor"
}

resource "azurerm_role_assignment" "aks_subnet_network" {
  scope                = var.aks_subnet_ids
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "Network Contributor"
}
