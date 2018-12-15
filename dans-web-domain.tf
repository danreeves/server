resource "digitalocean_domain" "danreeves" {
  name = "danreev.es"
  ip_address = "${digitalocean_droplet.dans-web-server.ipv4_address}"
}

resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.danreeves.name}"
  type = "CNAME"
  name = "www"
  value = "@"
  ttl = 3600
}
