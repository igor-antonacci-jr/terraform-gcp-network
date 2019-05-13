[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-network/job/master/)
#  terraform-gcp-network

Creates a DC/OS network for GCP for Masters and Agents

## EXAMPLE

```hcl
module "dcos-vpc" {
  source  = "dcos-terraform/network/gcp"
  version = "~> 0.1"

  agent_cidr_range = "10.65.0.0/16"
  master_cidr_range = "10.64.0.0/16"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| agent\_cidr\_range | Agent CIDR Range | string | n/a | yes |
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| master\_cidr\_range | Master CIDR Range | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| agent\_subnetwork\_name | Agent Subnetwork Name |
| master\_cidr\_range | Master CIDR Range |
| master\_subnetwork\_name | Master Subnetwork Name |
| name\_prefix | Name Prefix |
| network\_name | Name of the network created by this module |
| self\_link | Self link of the network created by this module |

