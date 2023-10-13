################################################################################
# env-variables.tf - Declare the variables used by the Terraform plan
################################################################################
# Copyright 2023 Salvatore D'Angelo
#
# Licensed under the MIT License. See the LICENSE file for details.
#
# Maintainer: Salvatore D'Angelo
################################################################################

# Variable for IBM Cloud API Key
variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
}

# The region in IBM Cloud where all the resources will be deployed
variable "region" {
  default = "us-south"
}

# The resource group in IBM Cloud where all the resources will be deployed
variable "resource_group" {
  default = "us-south-rg"
}

# This list declare the Subnets list. Each list component has:
# - subnet_name
# - zone_name
# - gw_index
# - ipv4_cidr_blk
variable "subnet_info" {
  description = "Map of subnets specific info"
  type        = list

  default     = []
}
