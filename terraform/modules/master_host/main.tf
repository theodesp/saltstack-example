
resource "scaleway_ip" "master_host" {
  server = "${scaleway_server.master_host.id}"
}

resource "scaleway_server" "master_host" {
  count               = 1
  name                = "${terraform.workspace}-master_host"
  image               = "${var.image}"
  type                = "${var.type}"
  dynamic_ip_required = true
  enable_ipv6 = false

  tags = ["master_host"]

  security_group = "${var.security_group}"

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    script = "${var.remote_exec_script}"
  }

  provisioner "file" {
    content     = "${file("scripts/master.conf")}"
    destination = "/etc/salt/master.d/master.conf"
  }
}
