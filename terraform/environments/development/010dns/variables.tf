variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "global_fqdn" {
  description = ""
  type        = string
  default     = "example.com"
}

variable "instance_name" {
  description = ""
  type        = string
  default     = "ns1"
}

variable "ansible_ssh_key_name" {
  description = ""
  type        = string
  default     = "ansible_ns1_dev_ecdsa"
}

variable "interface_name" {
  description = "Primary network interface name"
  type        = string
  default     = "eth0"
}
