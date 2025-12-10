
module "pip" {
    source = "../../../modules/pip"
    public_ip_name = var.public_ip_name
    tags = var.tags
    pip_resource_group_location = data.terraform_remote_state.resource_group.outputs.rg_location
    pip_resource_group_name = data.terraform_remote_state.resource_group.outputs.rg_name
} 