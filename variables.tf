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

variable "poolsize" { }

variable "region" {
    default = "us-south"
 }

variable "service_name" {
    default = "composeformysql"
 }

 variable "kube_version" {
    default = "3.11_openshift"
 }
 variable "hardware" {
    default = "shared"
 }
