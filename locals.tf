locals {
    root_dir = "${abspath(path.root)}"
    bootstrap_script_path = "${local.root_dir}/bootstrap-docker.sh"
    templates_dir = "${local.root_dir}/templates"
    devops_dir = "${dirname(local.root_dir)}/devops"
}