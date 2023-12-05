resource "linode_instance" "web" {
    // api-related args
    label = "simple_instance"
    image = "linode/ubuntu18.04"
    
    authorized_keys = ["ssh-rsa AAAA...Gw== user@example.local"]
    root_pass = "terr4form-test"

    group = "foo"
    tags = [ "foo" ]
    swap_size = 256
    private_ip = true
}

linode_instance.web.ip_address