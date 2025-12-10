module "gitops" {
  source = "../../../modules/gitops"
  gitops_repo_path = var.gitops_repo_path
  gitops_repo_url = var.gitops_repo_url

}