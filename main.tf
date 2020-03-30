provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
#   region = "${var.region}"
}


resource "ibm_container_cluster" "cluster" {
  name              = "${var.cluster_name}"
  datacenter        = "${var.datacenter}"
  hardware          = "${var.hardware}"
  default_pool_size = "${var.poolsize}"
  machine_type      = "${var.machine_type}"
  public_vlan_id    = "${var.public_vlan_id}"
  private_vlan_id   = "${var.private_vlan_id}"
  kube_version      = "${var.kube_version}"
}



resource "ibm_is_instance" "vpc_test_instance" {
  name    = "testinstance"
  image   = "${var.image_id}"
  profile = "${var.vpc_machine_type}"

  primary_network_interface {
    port_speed = "1000"
    subnet     = "${var.vpc_subnet_id}"
  }

  vpc  = "${var.vpc_id}"
  zone = "us-south-1"
  keys = ["${var.key_id}"]
}

resource "ibm_is_floating_ip" "vpc_test_instance_floatingip" {
  name   = "testfip1"
  target = ibm_is_instance.vpc_test_instance.primary_network_interface.0.id
}



# data "ibm_org" "org" {
#   org = "${var.org}"
# }

# data "ibm_space" "space" {
#   org   = "${var.org}"
#   space = "${var.space}"
# }

# resource "ibm_service_instance" "mysql_db" {
#   name       = "${var.service_name}"
#   space_guid = "${data.ibm_space.space.id}"
#   service    = "compose-for-mysql"
#   plan       = "Standard"
# }

# resource "ibm_service_key" "mysql_db_key" {
#   name                  = "db_key"
#   service_instance_guid = "${ibm_service_instance.mysql_db.id}"
# }

# resource "ibm_container_bind_service" "bind_service" {
#   cluster_name_id     = "${ibm_container_cluster.cluster.id}"
#   service_instance_id = "${ibm_service_instance.mysql_db.id}"
#   namespace_id        = "default"
# }



