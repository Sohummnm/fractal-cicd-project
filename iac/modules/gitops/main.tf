resource "azapi_resource" "flux_extension" {
  type      = "Microsoft.KubernetesConfiguration/extensions@2023-05-01"
  name      = "flux"
  parent_id = var.aks_cluster_id

  body = jsonencode({
    properties = {
      extensionType = "Microsoft.Flux"
      autoUpgradeMinorVersion = true
      releaseTrain = "Stable"

      scope = {
        cluster = {
          releaseNamespace = "flux-system"
        }
      }
      configurationSettings = {
        "namespace" = "flux-system"
      }
    }
  })
}

resource "azapi_resource" "flux_gitops" {
  type      = "Microsoft.KubernetesConfiguration/fluxConfigurations@2023-05-01"
  name      = "flux-gitops"
  parent_id = var.aks_cluster_id

  body = jsonencode({
    properties = {
      namespace  = "flux-system"
      sourceKind = "GitRepository"
      suspend    = false

      gitRepository = {
        url = var.gitops_repo_url
        repositoryRef = {
          branch = "main"
        }
        syncIntervalInSeconds = 60
      }

      kustomizations = {
        app = {
          path = var.gitops_repo_path
          prune = true
          syncIntervalInSeconds = 60
        }
      }
    }
  })

  depends_on = [
    azapi_resource.flux_extension
  ]
}
