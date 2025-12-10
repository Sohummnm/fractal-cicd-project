output "acr_id" {
  description = "Resource ID of the ACR"
  value       = module.acr.acr_id
}

output "acr_login_server" {
  description = "Login server URL of the ACR"
  value       = module.acr.acr_login_server
}