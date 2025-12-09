
module "rg" {
  source = "../../modules/resource-groups"
  rg_name = var.rg_name
  rg_location = var.rg_location
  tags = var.tags
}