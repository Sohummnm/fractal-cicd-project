variable "nsgs" {
  description = "Map of NSG names to create"
  type        = map(any)
}

variable "nsg_resource_group_name" {
  description = "Name of the resource group where NSGs will be created"
  type        = string
}

variable "nsg_resource_group_location" {
  description = "Location of the resource group for NSGs"
  type        = string
}

variable "tags" {
  description = "Tags to apply to NSGs"
  type        = map(string)
  default     = {}
}

variable "subnet_associations" {
  description = "Map of subnet IDs and NSG names for association"
  type = map(object({
    subnet_id = string
    nsg_name  = string
  }))
}

variable "aks_rules" {
  description = "Map of NSG rules for AKS"
  type        = map(any)
}

variable "appgw_rules" {
  description = "Map of NSG rules for AppGW"
  type        = map(any)
}

variable "db_rules" {
  description = "Map of NSG rules for DB"
  type        = map(any)
}
