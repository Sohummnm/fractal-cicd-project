variable "aks_cluster_id" {
  description = "Resource ID of the AKS cluster"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group where AKS resides"
  type        = string
}

variable "gitops_repo_url" {
  description = "Git repository URL for Flux configuration"
  type        = string
}

variable "gitops_repo_path" {
  description = "Path inside the Git repository to deploy"
  type        = string
}
