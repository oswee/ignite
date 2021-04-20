locals {
  pool = defaults(var.pool, {
    name  = terraform.workspace
    type  = "dir"
    path  = "/var/lib/libvirt/pools/${terraform.workspace}"
  })
}
