variable "linode_api_token" {
    sensitive = true
    description = "The Linode API Token"
}

variable "web_servers_count" {
    sensitive = false
    default = 1
    description = "The number of web servers to create"
    type = number
}

variable "ssh_public_key_path" {
    description = "SSH public key path to use for Linode instances"
    default     = "~/.ssh/id_rsa.pub"
    type        = string
    sensitive   = false
}

variable "ssh_private_key_path" {
    description = "Path to the SSH public key"
    default = "~/.ssh/id_rsa"
    sensitive   = true
}