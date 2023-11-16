output vm_ssh_string {
  value       = length(linode_instance.web) > 0 ? "ssh root@${linode_instance.web[0].ip_address}" : null
  sensitive   = false
}