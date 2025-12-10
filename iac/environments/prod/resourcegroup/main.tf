
module "rg" {
  source = "../../../modules/resource-groups"
  rg_name = var.rg_name
  location = var.rg_location
  tags = var.tags
}