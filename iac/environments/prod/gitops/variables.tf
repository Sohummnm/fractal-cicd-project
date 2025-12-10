variable "gitops_repo_url" {
  description = "URL of the Git repository"
  type        = string
}

variable "gitops_repo_path" {
  description = "Path in the Git repo for Flux kustomization"
  type        = string
  default     = "./"
}

