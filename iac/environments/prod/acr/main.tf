module "acr" {
  source = "../../../modules/acr"
  acr_name = var.acr_name
  sku = var.sku
  tags = var.tags
}