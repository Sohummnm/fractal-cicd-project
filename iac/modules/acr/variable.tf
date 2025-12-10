variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "acr_resource_group_name" {
  description = "Resource group where the ACR is created"
  type        = string
}

variable "acr_resource_group_location" {
  description = "Location of the resource group for ACR"
  type        = string
}

variable "sku" {
  description = "SKU of the ACR"
  type        = string
  default     = "Standard"
}

variable "aks_principal_id" {
  description = "Principal ID of the AKS cluster for ACR Pull role"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
