output "nomad_server_public_ip" {
  value = ["${module.nomad_server.instance_public_ip}"]
}

output "nomad_server_private_ip" {
  value = ["${module.nomad_server.instance_private_ip}"]
}

output "nomad_server_public_dns" {
  value = ["${module.nomad_server.instance_public_dns}"]
}

output "nomad_server_tags" {
  value = ["${module.nomad_server.instance_tags}"]
}

output "nomad_client_public_ip" {
  value = ["${module.nomad_client.instance_public_ip}"]
}

output "nomad_client_private_ip" {
  value = ["${module.nomad_client.instance_private_ip}"]
}

output "nomad_client_public_dns" {
  value = ["${module.nomad_client.instance_public_dns}"]
}

output "nomad_client_tags" {
  value = ["${module.nomad_client.instance_tags}"]
}

output "frontend_server_public_ip" {
  value = "${module.nomad_frontend.public_ip}"
}

# output "frontend_server_public_dns" {
#   value = "${module.nomad_frontend.public_dns}"
# }


# output "frontend_server_tags" {
#   value = "${module.nomad_frontend.tags}"
# }

