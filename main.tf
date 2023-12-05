terraform {
    required_providers {
        linode = {
            source = "linode/linode"
            # version = "2.10.1"
        }
    }
}

# Configure the Linode Provider
# provider "linode" {
#   token = "api-token"
# }