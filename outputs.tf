# Cluster Name
output "name_prefix" {
  value = "${var.name_prefix}"
}

# Master CIDR Range
output "master_cidr_range" {
  value = "${var.master_cidr_range}"
}

# Master Subnetwork Name
output "master_subnetwork_name" {
  value = "${google_compute_subnetwork.master-subnet.name}"
}

# Agent Subnetwork Name
output "agent_subnetwork_name" {
  value = "${google_compute_subnetwork.agent-subnet.name}"
}

output "network_name" {
  description = "Name of the network created by this module"
  value       = "${google_compute_network.network.name}"
}

output "self_link" {
  description = "Self link of the network created by this module"
  value       = "${google_compute_network.network.self_link}"
}
