variable "namespace_tolerations" {
    default = "[]"
}
variable "namespace_node_selector" {
    default = "priority=regular"
}

variable "utility_akv_id" {}
variable "cloudflare_email" {}