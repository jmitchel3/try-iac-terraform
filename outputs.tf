output "vm_ssh_string" {
    value = length(linode_instance.web) == 0 ? "No web ips" : "ssh root@${linode_instance.web[0].ip_address}"
    sensitive = false
}

output "vm_ssh_strings" {
    value = length(linode_instance.web) == 0 ? "No web ips" : templatefile("${local.templates_dir}/ssh-connect.tftpl", { ip_addresses = [for host in linode_instance.web.* : "${host.ip_address}"]})
    sensitive = false
}