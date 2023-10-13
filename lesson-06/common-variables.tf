################################################################################
# common-variables.tf - Common variables for the module
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