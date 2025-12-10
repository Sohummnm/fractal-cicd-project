output "flux_gitops_repo_url" {
  description = "Git repository URL used for Flux GitOps"
  value       = jsondecode(azapi_resource.flux_gitops.body)["properties"]["gitRepository"]["url"]
}