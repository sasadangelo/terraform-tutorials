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

# Resource group name which will contain all resources per environment (dev, stage, prd, etc)
variable "resource_group_name" {
  description = "Resource group name"
}

# This list declare the Public Gateways list. Each list component has:
# - gw_name
# - zone_name
variable "gw_info" {
  description = "Map of public gateways specific info"
  type        = list

  default     = []
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