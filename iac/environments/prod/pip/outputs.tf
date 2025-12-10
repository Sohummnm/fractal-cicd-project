output "public_ip_id" {
  description = "Resource ID of the Public IP"
  value       = module.pip.public_ip_id
}

output "public_ip_address" {
  description = "Actual IP address"
  value       = module.pip.public_ip_address
}