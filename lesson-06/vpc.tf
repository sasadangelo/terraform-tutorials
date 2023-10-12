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
  name = "${var.region}-rg"
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

# Create a VPC (Virtual Private Cloud)
resource "ibm_is_vpc" "testacc_vpc" {
  name = "${var.region}-rg-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}

# Create Public Gateways, one for each Availability Zone.
# As you can notice there is a loop through a gw_info info structure
# declared in the env-variables.tf file. It is basically a list of:
# - gw_name
# - zone_name
resource "ibm_is_public_gateway" "vpc_gateways" {
  count = 3
  resource_group = data.ibm_resource_group.resource_group.id
  vpc            = ibm_is_vpc.testacc_vpc.id
  name           = "${var.region}-gateway-${count.index + 1}"
  zone           = "${var.region}-${count.index + 1}"
}

# Create Subnets, four for each Availability Zone.
# The reason of four subnets for each AZs is 2 for the application, 1 for a database,
# and 1 for the monitoring.
# As you can notice there is a loop through a subnet_info info structure
# declared in the env-variables.tf file. It is basically a list of:
# - gw_index
# - ipv4_cidr_blk
resource "ibm_is_subnet" "vpc_subnets" {
  for_each        = { for i,v in var.subnet_info: i => v }
  resource_group  = data.ibm_resource_group.resource_group.id
  vpc             = ibm_is_vpc.testacc_vpc.id
  # name is <region>-vpc-subnet-<subnet 3rd octect ip range>
  name            = "${var.region}-vpc-subnet-${element(split(".", each.value.ipv4_cidr_blk), 2)}"
  # name is <region>-<gw_index +1>
  zone            = "${var.region}-${each.value.gw_index + 1}"
  public_gateway  = ibm_is_public_gateway.vpc_gateways[each.value.gw_index].id
  ipv4_cidr_block = each.value.ipv4_cidr_blk
}
