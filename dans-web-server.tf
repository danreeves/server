resource "digitalocean_droplet" "dans-web-server" {
  # image = "dokku-18-04"
  image = "debian-9-x64"
  name = "dans-web-server"
  region = "lon1"
  size = "s-2vcpu-2gb" # 2 CPUs 2GB Ram 6GB Storage

  private_networking = true
  resize_disk = true
  monitoring = true
  backups = true

  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  provisioner "remote-exec" {
    scripts = [
      "./scripts/sleep.sh",
      "./scripts/install-dokku.sh"
    ]
  }

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "10m"
  }
}

