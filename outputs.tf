output "cluster_name" {
  description = "Name of the DC/OS cluster"
  value       = "${local.cluster_name}"
}

output "master_cidr_range" {
  description = "Master CIDR Range"
  value       = "${var.master_cidr_range}"
}

output "master_subnetwork_name" {
  description = "Master Subnetwork Name"
  value       = "${join("", google_compute_subnetwork.master-subnet.*.name)}"
}

output "agent_subnetwork_name" {
  description = "Agent Subnetwork Name"
  value       = "${google_compute_subnetwork.agent-subnet.name}"
}

output "network_name" {
  description = "Name of the network created by this module"
  value       = "${google_compute_network.network.name}"
}

output "self_link" {
  description = "Self link of the network created by this module"
  value       = "${google_compute_network.network.self_link}"
}
