variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "master_cidr_range" {
  description = "Master CIDR Range"
}

variable "agent_cidr_range" {
  description = "Agent CIDR Range"
}

variable "name_prefix" {
  description = "Name Prefix"
  default     = ""
}
