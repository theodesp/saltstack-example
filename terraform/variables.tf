variable "region" {
  default = "ams1"
}
variable "master_instance_type" {
  description = "Type of salt master instance"
  default = "START1-S"
}

variable "master_bootstrap_script" {
  description = "Initial bootstap script to run on the master"
  default = "scripts/master-boot.sh"
}

variable "minion_bootstrap_script" {
  description = "Initial bootstap script to run on the minion"
  default = "scripts/minion-boot.sh"
}

variable "minion_instance_type" {
  description = "Type of salt minion instance"
  default = "START1-S"
}

variable "minion_instance_count" {
  description = "How many minions to spawn"
  default = 1
}
