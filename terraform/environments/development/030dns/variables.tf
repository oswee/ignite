variable "env_name" {
  description = "Environment name"
  type = string
  default = "dev"
}

variable "global_fqdn" {
  description = ""
  type = string
  default = "example.com"
}

variable "instance_name" {
  description = ""
  type = string
  default = "dns"
}

variable "ansible_ssh_key_name" {
  description = ""
  type = string
  default = "ansible_dns_dev_ecdsa"
}

