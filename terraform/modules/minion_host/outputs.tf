output "public_ip" {
  value = "${concat(scaleway_server.minion_host.*.name, scaleway_server.minion_host.*.public_ip)}"
}