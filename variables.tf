variable "ibmcloud_api_key" {
    description = "Your IBM Cloud IAM key to provision resources. Create an IBM Cloud IAM key here: cloud.ibm.com/iam/apikeys"
}

# variable "org" {
#     description = "Your IBM Cloud organization which is gnerally your email address. Run `ibmcloud cf orgs` to see all your orgs."
#  }

# variable "space" {
#     description = "Your IBM Cloud space to provision the Compose for MySQL service. Run `ibmcloud cf spaces` to see all your spaces."
# }

# variable "region" {
#     default = "us-south"
#     description = "Region to deploy your Compose MySQL instance."
#  }

variable "datacenter" {
    default = "wdc04"
    description = "The datacenter to provision your Kubernetes or OpenShift cluster in IBM Cloud."
}

variable "machine_type" {
    default = "b2c.4x16"
    description = "The flavor of worker node in your cluster. Run `ibmcloud ks flavors --zone <datacenter>` to see the different flavors."
}

variable "private_vlan_id" {
    description = "Your private VLAN ID. If you don't have one, set this value to 'null' and one will be created for you. Run `ic ks vlans --zone <datacenter>` to see your VLANs."
 }

variable "public_vlan_id" { 
    description = "Your private VLAN ID. If you don't have one, set this value to 'null' and one will be created for you. Run `ic ks vlans --zone <datacenter>` to see your VLANs."
}

variable "cluster_name" {
    default = "cluster1"
    description = "Name of your Kubernetes or OpenShift cluster."
}

variable "poolsize" {
    default = "2"
    description = "Number of nodes in your cluster."
}

# variable "service_name" {
#     default = "composeformysql"
#     description = "Service ID for the Compose for MySQL instance."
#  }

variable "kube_version" {
   default = "1.14.7"
   description = "Version of Kubernetes or OpenShift. Run `ic ks versions` to see all the versions."
}
variable "hardware" {
   default = "shared"
   description = "Type of hardware for Kubernetes or OpenShift cluster."
}
variable "vpc_id" {
   default = "01eda778-b822-43a2-816d-d30713df5e13"
   description = "ID of the VPC to place instances into, run `ibmcloud is vpcs` to see your VPCS and their ids. Do not include the prefix eg. `r006-`"
}
variable "image_id" {
   default = "7eb4e35b-4257-56f8-d7da-326d85452591"
   description = "ID of the image to build instances with, run `ibmcloud is images | grep -v deprecated | grep ubuntu | grep amd64` to see your available images and their ids. Do not include the prefix eg. `r006-`"
}

variable "vpc_machine_type" {
    default = "bx2-2x8"
    description = "The flavor of worker node in your cluster. Run `ibmcloud ks flavors --zone <datacenter>` to see the different flavors."
}

variable "vpc_subnet_id" {
   default = "70be8eae-134c-436e-a86e-04849f84cb34"
   description = "ID of the subnet to place instances into, run `ibmcloud is subnets` to see your VPCS and their ids. Do not include the prefix eg. `0171-`"
}


variable "key_id" {
   default = "eac87f33-0c00-4da7-aa66-dc2d972148bd"
   description = "ID of the key to build instances with, run `ibmcloud is keys` to see available keys and their ids. Do not include the prefix eg. `r006-`"
}
