################################################################################
# vsi-variables.tf - Declare the VSI variables used by the Terraform plan
################################################################################
# Copyright 2023 Salvatore D'Angelo
#
# Licensed under the MIT License. See the LICENSE file for details.
#
# Maintainer: Salvatore D'Angelo
################################################################################

# The VSI name
variable "vsi_name" {
  description = "The VSI name"
}

# The AZ where the VSI will be deployed
variable "vsi_zone" {
  description = "The AZ where the VSI will be deployed"
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

variable vsi_subnet_index {
  description = "The index of the subnet to use"
  type = number
}