resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = file(var.ssh_public_key_file)
}

data "cloudinit_config" "docker" {
  gzip          = false
  base64_encode = false

  part {
    content = file("cloudinit_template.yaml")
  }
}

resource "hcloud_server" "node1" {

  name        = "node1"
  server_type = "cx11"
  image       = "ubuntu-22.04"
  location    = "nbg1"
  ssh_keys    = [hcloud_ssh_key.default.id]
  user_data   = data.cloudinit_config.docker.rendered

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_private_key_file)
      host        = self.ipv4_address
    }
    inline = [
      "while [ ! -e '/cloud-init-completed' ]; do sleep 5 ; echo 'waiting for cloud-init to finish' ; done"
    ]
  }

}