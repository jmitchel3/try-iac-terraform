terraform {
    required_providers {
        linode = {
            source = "linode/linode"
            # version = "2.10.1"
        }
    }
}

# Configure the Linode Provider
provider "linode" {
  token = var.linode_api_token
}

resource "linode_instance" "web" {
    label = "simple_instance"
    image = "linode/ubuntu22.04"
    region = "us-central"
    type = "g6-nanode-1"
    # authorized_keys = ["ssh-rsa AAAA...Gw== user@example.local"]
    root_pass = var.linode_instance_pw
}

output "vm_ssh_string" {
    value = "ssh root@${linode_instance.web.ip_address}"
    sensitive = false
}