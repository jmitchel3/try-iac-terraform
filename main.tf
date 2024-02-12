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
    region = "us-sea"
    type = "g6-nanode-1"
    # trimspace is more relaiable from my latest tests
    authorized_keys = [trimspace(file(var.ssh_public_key_path))]
    # authorized_keys = [split("\n", file(var.ssh_public_key_path))[0]]
    tags = ["try-iac-web"]
    root_pass = var.linode_instance_pw
    
    # provisioner "file" {
    #     connection {
    #         host = "${self.ip_address}"
    #         type = "ssh"
    #         user = "root"
    #         private_key = "${file(var.ssh_private_key_path)}"
    #     }
    #     source = local.boostrap_script_path
    #     destination = "/tmp/bootstrap-docker.sh"
    # }

    # provisioner "remote-exec" {
    #     connection {
    #         host = "${self.ip_address}"
    #         type = "ssh"
    #         user = "root"
    #         private_key = "${file(var.ssh_private_key_path)}"
    #     }
    #     inline = [
    #         "chmod +x /tmp/bootstrap-docker.sh",
    #         "sudo sh /tmp/bootstrap-docker.sh"
    #     ]
    # }

    # provisioner "remote-exec" {
    #     connection {
    #         host = "${self.ip_address}"
    #         type = "ssh"
    #         user = "root"
    #         private_key = "${file(var.ssh_private_key_path)}"
    #     }
    #     inline = [
    #         "sudo apt-get update",
    #         "curl -fsSL https://get.docker.com | sudo su"
    #     ]
    # }
}

resource "local_file" "web_ips" {
  content = length(linode_instance.web) == 0 ? "No ips" : join("\n", [for host in linode_instance.web.*: "${host.ip_address}"])
  filename = "local-web-ips.txt"
}
