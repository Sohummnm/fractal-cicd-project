output "rg_name" {
  description = "name of the resource group"
  value = module.rg.rg_name
  
}

output "rg_location" {
  description = "location of the resource group"
  value = module.rg.rg_location
}

output "rg_id" {
  description = "id of the resource group"
  value = module.rg.rg_id
}

