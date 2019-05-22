variable "image" {}

variable "minion_instance_count" {
  default = 1
}

variable "security_group" {
  description = "Security Group to place servers in"
}

variable "remote_exec_script" {}

variable "master_host" {}

variable "type" {
  default     = "START1-S"
  description = "Scaleway Instance type"
}