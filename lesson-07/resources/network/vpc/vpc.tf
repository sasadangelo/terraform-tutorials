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

variable "name" {}
variable "resource_group" {}

# Create a VPC (Virtual Private Cloud)
resource "ibm_is_vpc" "itself" {
  name = var.name
  resource_group = var.resource_group
}

output "name" {
  value = ibm_is_vpc.itself.name
}

output "id" {
  value = ibm_is_vpc.itself.id
}