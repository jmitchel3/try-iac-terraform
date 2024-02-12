terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
  backend "s3" {}
}

provider "linode" {
  token = var.linode_api_token
}

resource "linode_instance" "web" {
    count = var.web_servers_count
    label = "try-iac-terraform-web-${count.index}"
    image = "linode/ubuntu22.04"
    region = "us-sea"
    type = "g6-standard-1"
    # I found that the method trimspace is more reliable
    authorized_keys = [trimspace(file(var.ssh_public_key_path))]
    # authorized_keys = [split(" \n", file(var.ssh_public_key_path))[0]]
    
    # provisioner "file" {
    #     connection {
    #         host = "${self.ip_address}"
    #         type = "ssh"
    #         user = "root"
    #         private_key = "${file(var.ssh_private_key_path)}"
    #     }
    #     source = local.bootstrap_script_path
    #     destination = "/tmp/bootstrap-docker.sh"
    # }

    #  provisioner "remote-exec" {
    #     connection {
    #         host = "${self.ip_address}"
    #         type = "ssh"
    #         user = "root"
    #         private_key = "${file(var.ssh_private_key_path)}"
    #     }
    #     inline = [
    #         "chmod +x /tmp/bootstrap-docker.sh",
    #         "sudo sh /tmp/bootstrap-docker.sh",
    #     ]
    # }

}
