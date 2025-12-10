 module "vnet" {
    source = "../../../modules/vnet"
    vnet_name = var.vnet_name
    address_space = var.address_space
    tags = var.tags
    subnets = var.subnets
    vnet_location = data.terraform_remote_state.resource_group.outputs.rg_location
    vnet_resource_group = data.terraform_remote_state.resource_group.outputs.rg_name
 }   