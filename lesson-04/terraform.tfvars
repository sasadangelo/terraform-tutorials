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

# In the IBM Cloud all the resources must belong to a Resource Group.
# This is the Resource Group where all our resources will be deployed.
resource_group_name = "test-per-db"

# The Public Gateways list. One for each Availability zone.
gw_info = [
  { gw_name = "us-south-gateway-1", zone_name = "us-south-1" },
  { gw_name = "us-south-gateway-2", zone_name = "us-south-2" },
  { gw_name = "us-south-gateway-3", zone_name = "us-south-3" }
]

# The VPC Subnets info. We will have 4 subnets for each Availability Zone.
# Each Subnet will have a predefine IP range (i.e. 10.243.NN.xx where NN is fixed) for a total of 255 available IPs.
subnet_info = [
  { subnet_name = "us-south-vpc-subnet1-20", zone_name = "us-south-1", gw_index = 0, ipv4_cidr_blk = "10.240.20.0/24" },
  { subnet_name = "us-south-vpc-subnet1-21", zone_name = "us-south-1", gw_index = 0, ipv4_cidr_blk = "10.240.21.0/24" },
  { subnet_name = "us-south-vpc-subnet1-22", zone_name = "us-south-1", gw_index = 0, ipv4_cidr_blk = "10.240.22.0/24" },
  { subnet_name = "us-south-vpc-subnet1-23", zone_name = "us-south-1", gw_index = 0, ipv4_cidr_blk = "10.240.23.0/24" },
  { subnet_name = "us-south-vpc-subnet2-84", zone_name = "us-south-2", gw_index = 1, ipv4_cidr_blk = "10.240.84.0/24" },
  { subnet_name = "us-south-vpc-subnet2-85", zone_name = "us-south-2", gw_index = 1, ipv4_cidr_blk = "10.240.85.0/24" },
  { subnet_name = "us-south-vpc-subnet2-86", zone_name = "us-south-2", gw_index = 1, ipv4_cidr_blk = "10.240.86.0/24" },
  { subnet_name = "us-south-vpc-subnet2-87", zone_name = "us-south-2", gw_index = 1, ipv4_cidr_blk = "10.240.87.0/24" },
  { subnet_name = "us-south-vpc-subnet3-148", zone_name = "us-south-3", gw_index = 2, ipv4_cidr_blk = "10.240.148.0/24" },
  { subnet_name = "us-south-vpc-subnet3-149", zone_name = "us-south-3", gw_index = 2, ipv4_cidr_blk = "10.240.149.0/24" },
  { subnet_name = "us-south-vpc-subnet3-150", zone_name = "us-south-3", gw_index = 2, ipv4_cidr_blk = "10.240.150.0/24" },
  { subnet_name = "us-south-vpc-subnet3-151", zone_name = "us-south-3", gw_index = 2, ipv4_cidr_blk = "10.240.151.0/24" }
]