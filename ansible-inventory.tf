resource "local_file" "ansible_inventory" {
    content = templatefile("${local.templates_dir}/ansible-inventory.tftpl", 
        { 
            web_instances=[for host in linode_instance.web.*: {ip_address = host.ip_address, label = host.label}],
            loadbalancers=tolist(linode_instance.web.*)
        }
    )
    filename = "${local.devops_dir}/ansible/inventory.ini"
}