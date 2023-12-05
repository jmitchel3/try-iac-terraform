locals {
    root_dir = "${abspath(path.root)}"
    scripts_dir = "${local.root_dir}/scripts"
    boostrap_script_path = "${local.scripts_dir}/bootstrap-docker.sh"
    templates_dir =  "${local.root_dir}/templates"
    hello_world_tftpl =  "${local.templates_dir}/hello-world.tftpl"
}