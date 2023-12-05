terraform {
    required_providers {
        linode = {
            source = "linode/linode"
            # version = "2.10.1"
        }
    }
}

variable "linode_api_token" {
    default="some-value"
    sensitive = false
}
# use var.linode_api_token

# Configure the Linode Provider
# provider "linode" {
#   token = "api-token"
# }