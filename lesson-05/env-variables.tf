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

# Set region in IBM Cloud
variable "region" {
  default = "us-south"
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
