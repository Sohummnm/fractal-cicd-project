module "gitops" {
  source = "../../../modules/gitops"

  aks_cluster_id          = data.terraform_remote_state.aks_cluster.outputs.aks_id
  resource_group_location = data.terraform_remote_state.resource_group.outputs.rg_location

  gitops_repo_url  = var.gitops_repo_url
  gitops_repo_path = var.gitops_repo_path
}