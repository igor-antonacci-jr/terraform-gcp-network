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

variable "disable_master_subnet" {
  description = "Do not create the master subnet"
  default     = false
}

variable "cluster_network_name" {
  description = "Name of the main network"
}
