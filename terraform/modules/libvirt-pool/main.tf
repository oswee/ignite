resource "libvirt_pool" "pool" {
  name = local.pool.name
  type = local.pool.type
  path = local.pool.path
}

