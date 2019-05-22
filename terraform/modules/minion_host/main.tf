resource "scaleway_ip" "minion_host_ip" {
  count = "${var.minion_instance_count}"
}

resource "scaleway_server" "minion_host" {
  count               = "${var.minion_instance_count}"
  name                = "${terraform.workspace}-minion-${count.index + 1}"
  image               = "${var.image}"
  type                = "${var.type}"
  public_ip           = "${element(scaleway_ip.minion_host_ip.*.ip, count.index)}"
  dynamic_ip_required = true
  enable_ipv6         = false

  tags = ["minion_host"]

  security_group = "${var.security_group}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    content     = "${data.template_file.minion_conf.rendered}"
    destination = "/etc/salt/minion"
  }

  provisioner "remote-exec" {
    script = "${var.remote_exec_script}"
  }
}

data "template_file" "minion_conf" {
  template = "${file("scripts/minion.tpl")}"

  vars {
    master_host = "${var.master_host}"
  }
}
