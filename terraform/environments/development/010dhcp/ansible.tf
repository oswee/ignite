resource "null_resource" "dhcp_config" {
  # triggers = {
  #   dhcp = module.dhcp
  # }

  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      host        = "dhcp"
      type        = "ssh"
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
    }
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "local-exec" {
    working_dir = "../../../../ansible"
    command     = <<EOT
      ansible-playbook playbooks/dhcp.yml
    EOT
  }

  depends_on = [
    local_file.ansible_ssh_priv_key,
    module.dhcp,
  ]
}


