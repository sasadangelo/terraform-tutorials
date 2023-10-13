################################################################################
# terraform.tfvars - Define the variables of your Terraform plan
################################################################################
# Copyright 2023 Salvatore D'Angelo
#
# Licensed under the MIT License. See the LICENSE file for details.
#
# Maintainer: Salvatore D'Angelo
################################################################################
# The region where the resources are deployed
region = "us-south"
# The resource group where the resources are deployed
resource_group = "us-south-rg"

# The VPC Subnets info. We will have 4 subnets for each Availability Zone.
# Each Subnet will have a predefine IP range (i.e. 10.243.NN.xx where NN is fixed) for a total of 255 available IPs.
subnet_info = [
  { gw_index = 0, ipv4_cidr_blk = "10.240.20.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.21.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.22.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.23.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.84.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.85.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.86.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.87.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.148.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.149.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.150.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.151.0/24" }
]
