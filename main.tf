resource "null_resource" "generate_self_ca" {
  provisioner "local-exec" {
    # script called with private_ips of nomad backend servers
    command = "${path.root}/scripts/gen_self_ca.sh ${var.nomad_region}"
  }
}

resource "random_id" "server_gossip" {
  byte_length = 16
}

# Module that creates Nomad server instances
module "nomad_server" {
  source = "modules/nomad_instance"

  region                 = "${var.region}"
  availability_zone      = "${var.availability_zone}"
  dc                     = "${var.datacenter}"
  nomad_region           = "${var.nomad_region}"
  authoritative_region   = "${var.authoritative_region}"
  nomad_instance_count   = "${var.servers_count}"
  access_key             = "${var.access_key}"
  secret_key             = "${var.secret_key}"
  instance_type          = "${var.instance_type}"
  public_key             = "${var.public_key}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  domain_name            = "${var.subdomain_name}"
  zone_name              = "${var.cloudflare_zone}"
  secure_gossip          = "${random_id.server_gossip.b64_std}"
}

# Module that creates Nomad client instances
module "nomad_client" {
  source = "modules/nomad_instance"

  region                 = "${var.region}"
  availability_zone      = "${var.availability_zone}"
  dc                     = "${var.datacenter}"
  nomad_region           = "${var.nomad_region}"
  instance_role          = "${var.instance_role}"
  nomad_instance_count   = "${var.clients_count}"
  access_key             = "${var.access_key}"
  secret_key             = "${var.secret_key}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  public_key             = "${var.public_key}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  domain_name            = "${var.subdomain_name}"
  zone_name              = "${var.cloudflare_zone}"
}

# Module that creates Nomad frontend instance
module "nomad_frontend" {
  source = "modules/nomad_frontend"

  region                 = "${var.region}"
  availability_zone      = "${var.availability_zone}"
  frontend_region        = "${var.nomad_region}"
  dc                     = "${var.datacenter}"
  access_key             = "${var.access_key}"
  secret_key             = "${var.secret_key}"
  instance_type          = "${var.instance_type}"
  public_key             = "${var.public_key}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  backend_private_ips    = "${module.nomad_server.instance_private_ip}"
  cloudflare_token       = "${var.cloudflare_token}"
  cloudflare_zone        = "${var.cloudflare_zone}"
  subdomain_name         = "${var.subdomain_name}"
  cloudflare_email       = "${var.cloudflare_email}"
  nomad_region           = "${var.nomad_region}"
}
