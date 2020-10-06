/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/)
 * #  terraform-gcp-network
 *
 * Creates a DC/OS network for GCP for Masters and Agents
 *
 * ## EXAMPLE
 *
 * ```hcl
 * module "dcos-vpc" {
 *   source  = "dcos-terraform/network/gcp"
 *   version = "~> 0.1"
 *
 *   agent_cidr_range = "10.65.0.0/16"
 *   master_cidr_range = "10.64.0.0/16"
 * }
 * ```
 */

provider "google" {}

locals {
  cluster_name = "${var.name_prefix != "" ? "${var.name_prefix}-${var.cluster_name}" : var.cluster_name}"
}

/* resource "google_compute_network" "network" {
  name                    = "${local.cluster_name}-network"
  auto_create_subnetworks = "false"
} */

data "google_compute_network" "network" {
  name                    = "${var.cluster_network_name != "" ? var.cluster_network_name : "${local.cluster_name}-network" }"
  #auto_create_subnetworks = "false"
}

## Two subnetworks (masters, agents)
resource "google_compute_subnetwork" "master-subnet" {
  count         = "${var.disable_master_subnet ? 0 : 1}"
  #name          = "${local.cluster_name}-master-subnet"
  name          = "${local.cluster_name}-master-network"
  ip_cidr_range = "${var.master_cidr_range}"
  network       = "${data.google_compute_network.network.self_link}"
}

resource "google_compute_subnetwork" "agent-subnet" {
  #name          = "${local.cluster_name}-agent-subnet"
  name          = "${local.cluster_name}-agent-network"
  ip_cidr_range = "${var.agent_cidr_range}"
  network       = "${data.google_compute_network.network.self_link}"
}
