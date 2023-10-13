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

# The VSI name
variable "vsi_name" {
  description = "The VSI name"
}

# The AZ where the VSI will be deployed
variable "vsi_zone" {
  description = "The AZ where the VSI will be deployed"
}

variable "vsi_subnet_name" {
  description = "name of subnet"
}

# The VSI Profile 
variable "vsi_profile" {
  description = "The VSI Profile"
}

# The 4th VSI IP 
variable "vsi_ip_octet" {
  default = 34
  description = "variable used to define the static IP for vsi, for example x.x.x.34"
}

# The VSI OS Image name
variable "vsi_os_image_name" {
  default = "ibm-centos-7-9-minimal-amd64-3"
}

variable vsi_volumes_sizes_gb {
  default = []
  description = "array containing the sizes of volumes to be created"
}

variable "vsi_volume_profile" {
  default = "general-purpose"
  description = "type of storage volume, refer to IBM Cloud docs for more info"
}

variable "vsi_with_fip" {
  default = false
  description = "allocate a floating IP"
}

variable vsi_keys {
  description = "The VSI SSH keys used to access to the machine and for automation"
}