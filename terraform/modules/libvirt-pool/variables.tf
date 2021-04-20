variable "pool" {
  description = "Libvirt storage pool"
  type        = object({
    name      = optional(string)
    type      = optional(string)
    path      = optional(string)
  })
}

