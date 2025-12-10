variable "public_ip_name" {
    description = "Mention the name of Public IP"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
variable "pip_resource_group_location" {
  description = "enter pip rg location"
}
variable "pip_resource_group_name" {
  description = "enter pip rg name"
}