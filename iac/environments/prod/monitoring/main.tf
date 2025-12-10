module "monitoring" {
    source= "../../modules/monitoring"
    name = var.workspace_name
    sku = var.workspace_sku
    retention_in_days = var.retention_in_days
    tags = var.tags
}