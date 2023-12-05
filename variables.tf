# to use var.linode_api_token
variable "linode_api_token" {
    default="some-value"
    sensitive = true
}

variable "linode_instance_pw" {
    sensitive = true
}

variable "linode_web_instance_count" {
  default = 2
  description = "The number of instances for webapp servers to create."
  type = number
}