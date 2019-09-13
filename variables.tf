variable "org" { }

variable "space" {}

variable "datacenter" {
    default="dal10"
}

variable "machine_type" {
    default="b2c.4x16"
}

variable "private_vlan_id" { }

variable "public_vlan_id" { }

variable "cluster_name" {
  default = "cluster"
}

variable "worker_num" { }

variable "region" {
    default = "us-south"
 }
