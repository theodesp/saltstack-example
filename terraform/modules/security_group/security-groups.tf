variable "master_ports" {
  description = "TCP ports which need to be accessible on the master only"
  # tcp 4505
  # tcp 4506
  default = [4505, 4506]
}

resource "scaleway_security_group" "master_security_group" {
  name        = "master_security_group"
  description = "Allow TCP and SSH traffic"
}

# resource "scaleway_security_group_rule" "ssh_accept" {
#   security_group = "${scaleway_security_group.master_security_group.id}"

#   action    = "accept"
#   direction = "inbound"
#   ip_range  = "0.0.0.0/0"
#   protocol  = "TCP"
#   port      = 22
# }

# # allow tcp traffic to master:
# resource "scaleway_security_group_rule" "accept-minions" {
#   security_group = "${scaleway_security_group.master_security_group.id}"

#   action    = "accept"
#   direction = "inbound"

#   ip_range = "0.0.0.0/0"
#   protocol = "TCP"
#   port     = "${element(var.master_ports, count.index)}"
#   count    = "${length(var.master_ports)}"
# }

resource "scaleway_security_group" "minion_workers" {
  name        = "minion_workers"
  description = "Allow SSH traffic"
}

# resource "scaleway_security_group_rule" "ssh_accept_workers" {
#   security_group = "${scaleway_security_group.minion_workers.id}"

#   action    = "accept"
#   direction = "inbound"
#   ip_range  = "0.0.0.0/0"
#   protocol  = "TCP"
#   port      = 22
# }
