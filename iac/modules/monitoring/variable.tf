variable "workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "workspace_sku" {
  description = "SKU of the Log Analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Data retention period in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the workspace"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Name of the resource group where the workspace will be created"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}
