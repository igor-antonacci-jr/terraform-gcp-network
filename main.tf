#provider "google" {}

resource "google_compute_network" "network" {
  name                    = "${var.name_prefix}-network"
  auto_create_subnetworks = "false"
}

## Two subnetworks (masters, agents)
resource "google_compute_subnetwork" "master-subnet" {
  name          = "${var.name_prefix}-master-subnet"
  ip_cidr_range = "${var.master_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_subnetwork" "agent-subnet" {
  name          = "${var.name_prefix}-agent-subnet"
  ip_cidr_range = "${var.agent_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
  region        = "${var.region}"
}

resource "google_compute_firewall" "internal-any-any" {
  name    = "${var.name_prefix}-internal-any-any"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "tcp"
  }

  source_ranges = ["10.0.0.0/8"]
  description   = "Used to allow internal access to all servers within the VPC 10.0.0.0/8 CIDR block range."
}

resource "google_compute_firewall" "adminrouter" {
  name    = "${var.name_prefix}-adminrouter-firewall"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["${var.admin_cidr}"]
  description   = "Used to allow HTTP and HTTPS access to DC/OS Adminrouter from the outside world specified by the user source range."
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.name_prefix}-ssh"
  network = "${google_compute_network.network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["${var.admin_cidr}"]
  description   = "Used to allow SSH access to any instance from the outside world specified by the user source range."
}
