# Cluster Name
variable "name_prefix" {
  description = "Cluster Name"
}

# Master CIDR Range
variable "master_cidr_range" {
  description = "master cidr range"
}

# Agent CIDR Range
variable "agent_cidr_range" {
  description = "agent cidr range"
}
