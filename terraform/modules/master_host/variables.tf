variable "image" {}

variable "security_group" {
  description = "Security Group to place servers in"
}

variable "remote_exec_script" {}

variable "type" {
  default     = "START1-S"
  description = "Scaleway Instance type"
}