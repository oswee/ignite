module "libvirt_pool" {
  source = "../../../modules/libvirt-pool"
  pool = {
    name = "${var.env_name}.${var.global_fqdn}"
    path = "${var.global_libvirt_pool_path}/${var.global_fqdn}/${var.env_name}"
  }
}

# module "management_network" {
#   source    = "../../../modules/libvirt-network"
#   addresses = ["192.168.66.0/24"]
#   network = {
#     name = "management"
#   }
#   domain = var.global_fqdn
# }

module "libvirt_network" {
  source    = "../../../modules/libvirt-network"
  addresses = var.addresses
  network = {
    name = "${var.env_name}.${var.global_fqdn}"
  }
  domain = "${var.env_name}.${var.global_fqdn}"
}
