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
  # Zone 1 subnets
  { gw_index = 0, ipv4_cidr_blk = "10.240.20.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.21.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.22.0/24" },
  { gw_index = 0, ipv4_cidr_blk = "10.240.23.0/24" },
  # Zone 2 subnets
  { gw_index = 1, ipv4_cidr_blk = "10.240.84.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.85.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.86.0/24" },
  { gw_index = 1, ipv4_cidr_blk = "10.240.87.0/24" },
  # Zone 3 subnets
  { gw_index = 2, ipv4_cidr_blk = "10.240.148.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.149.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.150.0/24" },
  { gw_index = 2, ipv4_cidr_blk = "10.240.151.0/24" }
]

vsi_name                      = "my-vsi"
vsi_zone                      = "us-south-1"
vsi_profile                   = "bx2-2x8"
vsi_os_image_name             = "ibm-ubuntu-22-04-3-minimal-amd64-1"
# Generate a SSH Key pais with the command:
# $ ssh-keygen -t rsa
# then put here the public key.
vsi_ssh_keys_name             = "us-south-rg-sshkey-0"
vsi_ssh_keys_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH0io55RYrRr4CAly6S9iGLtL3Wr3C+lJ7BD2VaYD5RGdYaPKh1iQi8TxFaj4nd9fM7JU9Za06QHyLLyL1Erx312G87oObiIxq0a1fhvOwNs07z/5VhjrVn6UbD8QJ5tR+atLndt3B1pOmng3FpOpLpQRXCMh4rN8hJ5Bp4gGVTtO1V34FqSvLdmFV9sYzeAdbe//jAbeqnNV2CkcDKOP5JryIxf3N89MbhwJwO35IvgyJgyJVAZiG9rSXgKeHOd91Ax3GeTKnCwHyyzoz9STg1ux/Ck/1zoYMlGFupuuA22KUl/5Fx61BYn2U00ZxueggLb/rL+qfKPe42sS7t4nObOURoSs9dxwBAcEb0PnKnSo36HgyoYLgvDHyaXvyRIzUm2vGo/JOtz/iUJonOR6v3OwbjLlhJCY5NsjrjwjbLBOowBf9s/6uoiSEYfaXVkGKjvuVi/BOfnrZCYF+eXtwI33pqVxiLdOtIIoMyfmh1dJCPaf+lkZuts+Il589NLk= sasadangelo@SalvatocBookNew"
