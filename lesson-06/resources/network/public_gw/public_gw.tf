################################################################################
# public_gw.tf - Creating a Public Gateway in a VPC
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

variable "public_gw_name" {}
variable "vpc" {}
variable "zone" {}
variable "resource_group" {}

resource "ibm_is_public_gateway" "itself" {
  count          = length(var.zone)
  name           = "${var.public_gw_name}-${count.index + 1}"
  vpc            = var.vpc
  zone           = var.zone[count.index]
  resource_group = var.resource_group

  timeouts {
    create = "90m"
  }
}

output "id" {
  value = ibm_is_public_gateway.itself.*.id
}
