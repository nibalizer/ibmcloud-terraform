variable "ibmcloud_api_key" {}

provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
  region = "${var.region}"
}

data "ibm_org" "org" {
  org = "${var.org}"
}

data "ibm_space" "space" {
  org   = "${var.org}"
  space = "${var.space}"
}

resource "ibm_container_cluster" "cluster" {
  name              = "${var.cluster_name}"
  datacenter        = "${var.datacenter}"
  hardware          = "shared"
  default_pool_size = "${var.poolsize}"
  machine_type      = "${var.machine_type}"
  public_vlan_id    = "${var.public_vlan_id}"
  private_vlan_id   = "${var.private_vlan_id}"
}

resource "ibm_service_instance" "mysql_db" {
  name       = "composeformysql"
  space_guid = "${data.ibm_space.space.id}"
  service    = "compose-for-mysql"
  plan       = "Standard"
}

resource "ibm_service_key" "mysql_db_key" {
  name                  = "db_key"
  service_instance_guid = "${ibm_service_instance.mysql_db.id}"
}

resource "ibm_container_bind_service" "bind_service" {
  cluster_name_id     = "${ibm_container_cluster.cluster.id}"
  service_instance_id = "${ibm_service_instance.mysql_db.id}"
  namespace_id        = "default"
}
