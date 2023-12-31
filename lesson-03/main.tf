################################################################################
# main.tf - Creating a Virtual Private Cloud (VPC) on IBM Cloud
################################################################################
# Copyright 2023 Salvatore D'Angelo
#
# Licensed under the MIT License. See the LICENSE file for details.
#
# Maintainer: Salvatore D'Angelo
################################################################################

# Define required providers, in this case, IBM Cloud provider
terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

# Define a data source to retrieve an IBM Cloud resource group
data ibm_resource_group resource_group {
  name = var.resource_group_name
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

# Create a VPC (Virtual Private Cloud)
resource "ibm_is_vpc" "testacc_vpc" {
  name = "${var.resource_group_name}-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}

# Create Public Gateways, one for each Availability Zone.
# As you can notice there is a loop through a gw_info info structure
# declared in the env-variables.tf file. It is basically a list of:
# - gw_name
# - zone_name
resource "ibm_is_public_gateway" "vpc_gateways" {
  for_each       = { for i,v in var.gw_info: i => v }
  resource_group = data.ibm_resource_group.resource_group.id
  vpc            = ibm_is_vpc.testacc_vpc.id
  name           = each.value.gw_name
  zone           = each.value.zone_name
}
