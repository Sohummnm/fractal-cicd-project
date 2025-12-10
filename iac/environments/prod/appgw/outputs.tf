output "appgw_id" {
  description = "Resource ID of the Application Gateway"
  value       = module.appgw.appgw_id
}

output "appgw_name" {
  description = "Name of the Application Gateway"
  value       = module.appgw.appgw_name
}

output "appgw_public_ip_id" {
  description = "Public IP resource ID attached to the AppGW frontend"
  value       = module.appgw.appgw_public_ip_id
}
output "appgw_public_ip_address" {
  description = "IP address of App Gateway"
  value = module.appgw.appgw_public_ip_address
}
