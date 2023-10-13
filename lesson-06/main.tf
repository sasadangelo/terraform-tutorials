terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
}
variable "region" {}
variable "resource_group" {}

data ibm_resource_group rg {
  name = var.resource_group
}

data "ibm_is_vpc" "vpc" {
  name = "${var.region}-rg-vpc"
  depends_on = [module.vpc]
}

module "vpc" {
  source = "./resources/network/vpc"
  resource_group = data.ibm_resource_group.rg.id
  name = "${var.region}-vpc"
}

// This module creates a public gateway if needed
#module "public_gw" {
#  count = 3
#  source          = "./resources/network/public_gw"
#  public_gw_name  = "${var.region}-gateway-${count.index + 1}"
#  vpc             = data.ibm_is_vpc.vpc.id
#  zone            = "${var.region}-${count.index + 1}"
#  resource_group  = data.ibm_resource_group.resource_group.id
#}