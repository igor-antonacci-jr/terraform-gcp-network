provider "google" {}

resource "google_compute_network" "network" {
  name                    = "${var.cluster_name}-network"
  auto_create_subnetworks = "false"
}

## Two subnetworks (masters, agents)
resource "google_compute_subnetwork" "master-subnet" {
  name          = "${var.cluster_name}-master-subnet"
  ip_cidr_range = "${var.master_ip_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
  region        = "${var.gcp_region}"
}

resource "google_compute_subnetwork" "agent-subnet" {
  name          = "${var.cluster_name}-agent-subnet"
  ip_cidr_range = "${var.agent_ip_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
  region        = "${var.gcp_region}"
}
