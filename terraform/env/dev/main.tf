resource "random_pet" "instance" {}

resource "tls_private_key" "ansible" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P521"
}

# Save the private key so that ansible can accsess this guest
resource "local_file" "ansible_ssh_priv_key" {
    content     = tls_private_key.ansible.private_key_pem
    filename = pathexpand("~/.ssh/ansible_ecdsa")
    file_permission = "0600"
}

module "libvirt_pool" {
  source = "../../modules/libvirt-pool"
  pool   = {
    name = terraform.workspace
  }
}

module "libvirt_network" {
  source   = "../../modules/libvirt-network"
  addresses = var.addresses
  network = {
    name = terraform.workspace
  }
}

module "dhcp" {
  # source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../../dzintars/terraform-libvirt-domain"

  volume = {
    name = "dhcp"
    pool = module.libvirt_pool.name
  }

  cloudinit = {
    name = null
    interface_name = "eth0"
    addresses = "192.168.67.254/24"
    gateway   = "192.168.67.1"
    nameservers = {
      ns1 = "1.1.1.1"
      ns2 = "9.9.9.9"
      ns3 = null
    }
  }

  vm = {
    user = "ansible"
    user_ssh_pub_key = tls_private_key.ansible.public_key_openssh
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name = "dhcp"
    memory = "2048"
    vcpu   = "2"
  }

  network = {
    name = module.libvirt_network.name
    mac  = "3a:72:7b:74:25:b4"
  }
}

