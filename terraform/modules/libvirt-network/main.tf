resource "libvirt_network" "network" {
  name      = local.network.name
  mode      = var.mode
  domain    = var.domain
  addresses = var.addresses
  autostart = var.autostart
  dhcp {
    enabled = var.dhcp.enabled
  }
  dns {
    enabled = var.dhcp.enabled
  }
}

