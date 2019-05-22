output "public_ip" {
  value = "${scaleway_ip.master_host.ip}"
}