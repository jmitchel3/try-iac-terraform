output "vm_ssh_string" {
    value = "ssh root@${linode_instance.web[0].ip_address}"
    sensitive = false
}

output "vm_ssh_strings" {
    value = templatefile("${local.templates_dir}/ssh-connect.tftpl", { ip_addresses = [for host in linode_instance.web.* : "${host.ip_address}"]})
    sensitive = false
}