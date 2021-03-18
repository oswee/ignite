resource "libvirt_pool" "pool" {
  name = terraform.workspace
  type = "dir"
  path = "/var/lib/libvirt/pools/${terraform.workspace}"
}

resource "libvirt_network" "network" {
  name      = terraform.workspace
  mode      = "nat"
  domain    = var.domain
  addresses = ["192.168.124.0/24"]
  autostart = true
  dhcp {
    enabled = true
  }
  dns {
    enabled = true
  }
}
module "bastion" {
  source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  pool = {
    name = libvirt_pool.pool.name
  }

  volume = {
    pool = libvirt_pool.pool.name
  }

  cloudinit = {}

  vm = {}

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    memory = "2048"
    vcpu   = "2"
  }

  network = {
    name = libvirt_network.network.name
  }
}

# module "bastion" {
#   source = "../../modules/libvirt-domain"

#   pool_name       = module.libvirt_pool.name
#   network_id      = module.libvirt_network.id
#   network_name    = module.libvirt_network.name
#   img_url         = "https://mirror.netsite.dk/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2"
#   instance_count  = 1
#   vault_addr      = "https://vault.oswee.com"
#   vault_role_id   = module.vault-ssh.approle.role
#   vault_secret_id = module.vault-ssh.approle.secret
#   user            = "ansible"
# }

# module "vault" {
#   source = "../../modules/vault"
# }

# module "vault-ssh" {
#   source = "../../modules/vault-ssh"

#   user            = "ansible"
# }
