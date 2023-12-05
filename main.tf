terraform {
    required_providers {
        linode = {
            source = "linode/linode"
            # version = "2.10.1"
        }
    }
    backend "s3" {}
}

# Configure the Linode Provider
provider "linode" {
  token = var.linode_api_token
}

resource "linode_instance" "web" {
    count = var.linode_web_instance_count
    label = "try-iac-tf-${count.index}"
    image = "linode/ubuntu22.04"
    region = "us-central"
    type = "g6-nanode-1"
    authorized_keys = [split("\n", file(var.ssh_public_key_path))[0]]
    tags = ["try-iac-web"]
    root_pass = var.linode_instance_pw
}

output "vm_ssh_string" {
    value = "ssh root@${linode_instance.web[0].ip_address}"
    sensitive = false
}