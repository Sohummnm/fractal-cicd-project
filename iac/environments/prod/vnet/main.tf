 module "vnet" {
    source = "../../../modules/vnet"
    vnet_name = var.vnet_name
    address_space = var.address_space
    tags = var.tags
    subnets = var.subnets
 }   