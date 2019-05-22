provider "scaleway" {
  region = "${var.region}"
}

module "security_group" {
  source = "./modules/security_group"
}

module "master_host" {
  source = "./modules/master_host"

  security_group = "${module.security_group.id}"
  type  = "${var.master_instance_type}"
  image = "${data.scaleway_image.ubuntu.id}"

  remote_exec_script ="${var.master_bootstrap_script}"
}

module "minion_host" {
  source = "./modules/minion_host"

  security_group = "${module.security_group.id}"
  type  = "${var.minion_instance_type}"
  image = "${data.scaleway_image.ubuntu.id}"
  minion_instance_count = 1
  master_host = "${module.master_host.public_ip}"

  remote_exec_script ="${var.minion_bootstrap_script}"
}

data "scaleway_image" "ubuntu" {
  architecture = "x86_64"
  name         = "Ubuntu Xenial"
}