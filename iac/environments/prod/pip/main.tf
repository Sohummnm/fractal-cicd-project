
module "pip" {
    source = "../../modules/pip"
    name = var.public_ip_name
    tags = var.tags
}