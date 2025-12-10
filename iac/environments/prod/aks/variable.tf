variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for AKS"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}

variable "resource_group_id" {
  description = "Resource group ID for role assignments"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
}

variable "authorized_ip_ranges" {
  description = "Authorized IP ranges for API server"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}



variable "node_count" {
  description = "Initial node count"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "min_count" {
  description = "Minimum node count for autoscaling"
  type        = number
  default     = 2
}

variable "max_count" {
  description = "Maximum node count for autoscaling"
  type        = number
  default     = 2
}

variable "service_cidr" {
  description = "Service CIDR"
  type        = string
  default     = "10.1.0.0/16"
}

variable "dns_service_ip" {
  description = "DNS service IP"
  type        = string
  default     = "10.1.0.10"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
