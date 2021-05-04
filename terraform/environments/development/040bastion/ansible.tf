resource "null_resource" "bastion_config" {
  # triggers = {
  #   dhcp = module.dns
  # }

  provisioner "remote-exec" {
    inline = ["echo Waiting for SSH..."]
    connection {
      host        = "bastion"
      type        = "ssh"
      user        = "ansible"
      private_key = tls_private_key.ansible.private_key_pem
    }
  }

  # https://www.digitalocean.com/community/tutorials/how-to-use-ansible-with-terraform-for-configuration-management
  provisioner "local-exec" {
    working_dir = "../../../../ansible"
    command     = <<EOT
      ansible-playbook playbooks/bastion.yml
    EOT
  }

  depends_on = [
    local_file.ansible_ssh_priv_key,
    module.bastion,
  ]
}


