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

variable "resource_group" {}
variable "zone" {}
variable "vpc" {}
variable "subnet_name" {}
variable "ipv4_cidr_block" {}

# Create Subnets, four for each Availability Zone.
# The reason of four subnets for each AZs is 2 for the application, 1 for a database,
# and 1 for the monitoring.
# As you can notice there is a loop through a subnet_info info structure
# declared in the env-variables.tf file. It is basically a list of:
# - gw_index
# - ipv4_cidr_blk
resource "ibm_is_subnet" "itself" {
  name            = var.subnet_name
  vpc             = var.vpc
  zone            = var.zone
  ipv4_cidr_block = var.ipv4_cidr_block
  resource_group  = var.resource_group
}

output "id" {
  value = ibm_is_subnet.itself.id
}

output "ipv4_cidr_block" {
  value = ibm_is_subnet.itself.ipv4_cidr_block
}