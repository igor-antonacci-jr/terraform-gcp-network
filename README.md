#  terraform-gcp-network

Creates a DC/OS network for GCP for Masters and Agents

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| agent_cidr_range | Agent CIDR Range | string | - | yes |
| cluster_name | Cluster Name | string | - | yes |
| gcp_region | Network Name | string | - | yes |
| master_ip_cidr_range | Master CIDR Range | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| agent_cidr_range | Agent CIDR Range |
| cluster_name | Cluster Name |
| gcp_region | GCP Region |
| master_ip_cidr_range | Master CIDR Range |
