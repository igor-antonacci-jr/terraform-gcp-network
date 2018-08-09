# Cluster Name
output "cluster_name" {
  value = "${var.cluster_name}"
}

# Master CIDR Range
output "master_ip_cidr_range" {
  value = "${var.master_ip_cidr_range}"
}

# GCP Region
output "gcp_region" {
  value = "${var.gcp_region}"
}

# Agent CIDR Range
output "agent_cidr_range" {
  value = "${var.agent_cidr_range}"
}
