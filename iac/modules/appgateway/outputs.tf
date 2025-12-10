output "appgw_id" {
  description = "Resource ID of the Application Gateway"
  value       = azurerm_application_gateway.appgw_prod_aks.id
}

output "appgw_name" {
  description = "Name of the Application Gateway"
  value       = azurerm_application_gateway.appgw_prod_aks.name
}

output "appgw_public_ip_id" {
  description = "Public IP resource ID attached to the AppGW frontend"
  value       = azurerm_application_gateway.appgw_prod_aks.frontend_ip_configuration[0].public_ip_address_id
}
output "appgw_public_ip_address" {
  description = "Public IP address of the Application Gateway"
  value       = var.public_ip_address
}
