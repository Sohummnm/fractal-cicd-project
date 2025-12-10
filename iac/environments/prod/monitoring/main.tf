module "monitoring" {
    source= "../../../modules/monitoring"
    workspace_name = var.workspace_name
    workspace_sku = var.workspace_sku
    retention_in_days = var.retention_in_days
    tags = var.tags
}