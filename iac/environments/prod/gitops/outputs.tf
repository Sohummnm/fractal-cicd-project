output "flux_gitops_repo_url" {
  description = "Git repository URL used for Flux GitOps"
  value       = module.gitops.flux_gitops_repo_url
}