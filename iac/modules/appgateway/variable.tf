variable "appgw_name" {
  description = "Name of the Application Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where AppGW will be deployed"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the Application Gateway"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP resource ID for frontend configuration"
  type        = string
}

variable "sku_name" {
  description = "SKU name of Application Gateway"
  type        = string
}

variable "sku_tier" {
  description = "SKU tier of Application Gateway"
  type        = string
}

variable "sku_capacity" {
  description = "Capacity of Application Gateway"
  type        = number
}

variable "backend_ips" {
  description = "Backend IP addresses for the pool"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to assign"
  type        = map(string)
  default     = {}
}
variable "public_ip_address" {
  type        = string
  description = "Public IP address for the App Gateway"
}
