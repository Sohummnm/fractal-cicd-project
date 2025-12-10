
module "pip" {
    source = "../../../modules/pip"
    public_ip_name = var.public_ip_name
    tags = var.tags
} 