terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

variable "ibmcloud_api_key" {
  type        = string
  sensitive   = true
  description = "IBM Cloud API Key"
  validation {
    condition     = var.ibmcloud_api_key != ""
    error_message = "API key for IBM Cloud must be set."
  }
}
variable "region" {}

data ibm_resource_group resource_group {
  name = "${var.region}-rg"
}

data "ibm_is_vpc" "vpc" {
    name = "${var.region}-rg-vpc"
    depends_on = [module.vpc]
}

module "vpc" {
  source                        = "./resources/network/vpc"
  resource_group                = data.ibm_resource_group.resource_group.id
  name                          = "${var.region}-vpc"
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