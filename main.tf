provider "google" {}

module "master-frontend-compute-firewall" {
  source  = "dcos-terraform/compute-firewall/gcp"
  version = "~> 0.0"

  providers = {
    google = "google"
  }

  name_prefix         = "${var.name_prefix}"
  network             = "${data.google_compute_subnetwork.a.network}"
  instances_self_link = "${module.dcos-master-instances.instances_self_link}"
  admin_cidr          = "${var.admin_cidr}"
  dcos_role           = "master"
}


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
