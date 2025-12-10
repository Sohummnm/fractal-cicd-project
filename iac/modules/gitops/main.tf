resource "azapi_resource" "flux_extension" {
  type      = "Microsoft.KubernetesConfiguration/extensions@2022-03-01"
  name      = "flux"
  parent_id = var.aks_cluster_id

  body = jsonencode({
    properties = {
      extensionType            = "flux"
      autoUpgradeMinorVersion  = true
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
  parent_id = var.aks_cluster_id
  location  = var.resource_group_location

  body = jsonencode({
    properties = {
      scope      = "cluster"
      namespace  = "flux-system"
      sourceKind = "GitRepository"
      
      gitRepository = {
        url                    = var.gitops_repo_url
        syncIntervalInSeconds  = 60
        httpsCACert            = null
      }

      kustomizations = {
        app = {
          path                     = var.gitops_repo_path
          prune                    = true
          retryIntervalInSeconds   = 60
        }
      }
    }
  })

  depends_on = [azapi_resource.flux_extension]
}
