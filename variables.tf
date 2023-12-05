# to use var.linode_api_token
variable "linode_api_token" {
    default="some-value"
    sensitive = true
}

variable "linode_instance_pw" {
    sensitive = true
}