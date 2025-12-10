output "aks_id" {
  value = module.aks.aks_id
}

output "aks_name" {
  value = module.aks.aks_name
}

output "aks_kube_config" {
  value     = module.aks.aks_kube_config
  sensitive = true
}

output "principal_id" {
  value = module.aks.principal_id
}