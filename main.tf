/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/)
 * #  terraform-gcp-network
 *
 * Creates a DC/OS network for GCP for Masters and Agents
 */

provider "google" {}

resource "google_compute_network" "network" {
  name                    = "${var.name_prefix}-network"
  auto_create_subnetworks = "false"
}

## Two subnetworks (masters, agents)
resource "google_compute_subnetwork" "master-subnet" {
  name          = "${var.name_prefix}-master-subnet"
  ip_cidr_range = "${var.master_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
}

resource "google_compute_subnetwork" "agent-subnet" {
  name          = "${var.name_prefix}-agent-subnet"
  ip_cidr_range = "${var.agent_cidr_range}"
  network       = "${google_compute_network.network.self_link}"
}
