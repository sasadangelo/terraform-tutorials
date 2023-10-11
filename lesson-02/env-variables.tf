################################################################################
# env-variables.tf - Declare the variables used by the Terraform plan
################################################################################
# Copyright 2023 Salvatore D'Angelo
#
# Licensed under the MIT License. See the LICENSE file for details.
#
# Maintainer: Salvatore D'Angelo
################################################################################

# Set region in IBM Cloud
variable "region" {
  default = "us-south"
}

# Resource group name which will contain all resources per environment (dev, stage, prd, etc)
variable "resource_group_name" {
  description = "Resource group name"
}
