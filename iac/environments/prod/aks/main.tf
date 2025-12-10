module "aks" {
    source = "../../../modules/aks"
    cluster_name = var.cluster_name
    dns_prefix = var.dns_prefix
    vm_size = var.vm_size
    user_node_pool_vm_size = var.user_node_pool_vm_size
    tags = var.tags
  
}