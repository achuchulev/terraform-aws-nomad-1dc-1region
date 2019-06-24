variable "servers_count" {
  description = "The number of servers to provision."
  default     = "3"
}

variable "clients_count" {
  description = "The number of clients to provision."
  default     = "3"
}

variable "datacenter" {
  description = "The name of Nomad datacenter."
  type        = "string"
  default     = "dc1"
}

variable "nomad_region" {
  description = "The name of Nomad region."
  type        = "string"
  default     = "global"
}

variable "authoritative_region" {
  description = "Points the Nomad's authoritative region."
  type        = "string"
  default     = "global"
}

variable "access_key" {}
variable "secret_key" {}

variable "instance_role" {}

variable "public_key" {}

variable "region" {
  default = "us-east-2"
}

variable "availability_zone" {
  default = "us-east-2b"
}

variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}

variable "vpc_security_group_ids" {
  type = "list"
}

variable "cloudflare_email" {}
variable "cloudflare_token" {}
variable "cloudflare_zone" {}
variable "subdomain_name" {}
