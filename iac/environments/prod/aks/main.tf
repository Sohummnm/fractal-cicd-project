module "aks" {
    source = "../../../modules/aks"
    cluster_name = var.cluster_name
    dns_prefix = var.dns_prefix
    vm_size = var.vm_size
    tags = var.tags

}