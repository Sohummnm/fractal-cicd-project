resource "azapi_resource" "flux_extension" {
  type      = "Microsoft.KubernetesConfiguration/extensions@2022-03-01"
  name      = "flux"
  parent_id = data.terraform_remote_state.aks_cluster.id

  body = jsonencode({
    properties = {
      extensionType = "flux"
      autoUpgradeMinorVersion = true
      scope = {
        cluster = {
          releaseNamespace = "flux-system"
        }
      }
    }
  })
}

resource "azapi_resource" "flux_gitops" {
  type      = "Microsoft.KubernetesConfiguration/fluxConfigurations@2022-03-01"
  name      = "flux-gitops"
  parent_id = data.terraform_remote_state.aks_cluster.outputs.aks_id
  location  = data.terraform_remote_state.resource_group.rg_location

  body = jsonencode({
    properties = {
      scope      = "cluster"
      namespace  = "flux-system"
      sourceKind = "GitRepository"
      
      gitRepository = {
        url = var.gitops_repo_url
        syncIntervalInSeconds = 60
        httpsCACert = null
      }

      kustomizations = {
        app = {
          path = var.gitops_repo_path
          prune = true
          retryIntervalInSeconds = 60
        }
      }
    }
  })

  depends_on = [azapi_resource.flux_extension]
}
