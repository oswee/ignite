module "dhcp" {
  # source = "git@github.com:dzintars/terraform-libvirt-domain.git?ref=v0.0.1-alpha"
  source = "../../../../../../dzintars/terraform-libvirt-domain"

  volume = {
    name = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    pool = data.terraform_remote_state.base.outputs.libvirt_pool.name
  }

  cloudinit = {
    name = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    dhcp = false
    interface_name = "eth0"
    addresses = "192.168.67.253/24"
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
    hostname = var.instance_name
    domain   = "${var.env_name}.${var.global_fqdn}"
  }

  vault = {
    address   = "https://vault.example.local"
    role_id   = "role-id"
    secret_id = "secret-id"
  }

  domain = {
    name = "${var.instance_name}.${var.env_name}.${var.global_fqdn}"
    memory = "1024"
    vcpu   = "2"
  }

  network = {
    name = data.terraform_remote_state.base.outputs.libvirt_network.name
    mac  = "3a:72:7b:74:25:b4"
    wait_for_lease = false
  }
}

