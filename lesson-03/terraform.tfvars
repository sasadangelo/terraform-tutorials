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