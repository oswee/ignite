resource "random_pet" "instance" {}

locals {
  pool = defaults(var.pool, {
    name  = random_pet.instance.id
    type  = "dir"
    path  = "/var/lib/libvirt/pools/${random_pet.instance.id}}"
  })
}
