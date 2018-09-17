
# Cluster Name
variable "name_prefix" {}

# Master CIDR Range 
variable "master_cidr_range" {}

# Network Name
variable "region" {}

# Agent CIDR Range
variable "agent_cidr_range" {}

# List of allowed IPs to access DCOS cluster
variable "admin_cidr" {
  default = "0.0.0.0/0"
}
