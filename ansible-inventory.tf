variable "ansible_webapps_count" {
    default = 3
    type = number
}

resource "linode_instance" "ansible_lb" {
    label = "try-iac-ansible-lb"
    image = "linode/ubuntu22.04"
    region = "us-sea"
    type = "g6-nanode-1"
    authorized_keys = [split("\n", file(var.ssh_public_key_path))[0]]
    tags = ["try-iac-ansible"]
    root_pass = var.linode_instance_pw
}

resource "linode_instance" "ansible_webapps" {
    count = var.ansible_webapps_count
    label = "try-iac-ansible-${count.index}"
    image = "linode/ubuntu22.04"
    region = "us-sea"
    type = "g6-nanode-1"
    authorized_keys = [split("\n", file(var.ssh_public_key_path))[0]]
    tags = ["try-iac-ansible"]
    root_pass = var.linode_instance_pw
}

resource "local_file" "ansible_inventory" {
    content = templatefile(
        "${local.templates_dir}/ansible-inventory.tftpl",
        {
            lb_ip_addr = linode_instance.ansible_lb.ip_address,
            ip_addresses = [for host in linode_instance.ansible_webapps.*: "${host.ip_address}"]
        }
    )
    filename = "${local.devops_dir}/try-iac-ansible/inventory.ini"
}