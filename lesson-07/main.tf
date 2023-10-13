terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}

data ibm_resource_group rg {
  name = var.resource_group
}

# Configure the IBM Provider
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

data "ibm_is_vpc" "vpc" {
  name = "${var.resource_group}-vpc"
  depends_on = [module.vpc]
}

data ibm_is_image image {
  name = var.vsi_os_image_name
}

module "vpc" {
  source         = "./resources/network/vpc"
  resource_group = data.ibm_resource_group.rg.id
  name           = "${var.resource_group}-vpc"
}

data "ibm_is_image" "stock_image" {
  name = var.vsi_os_image_name
}

// This module creates a public gateway if needed
module "public_gw" {
  count = 3
  source          = "./resources/network/public_gw"
  public_gw_name  = "${var.region}-gateway-${count.index + 1}"
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = "${var.region}-${count.index + 1}"
  resource_group  = data.ibm_resource_group.rg.id
}

module "subnet" {
  for_each        = { for i,v in var.subnet_info: i => v }
  source            = "./resources/network/subnet"
  subnet_name       = "${var.region}-vpc-subnet-${element(split(".", each.value.ipv4_cidr_blk), 2)}"
  vpc               = data.ibm_is_vpc.vpc.id
  zone            = "${var.region}-${each.value.gw_index + 1}"
  ipv4_cidr_block = each.value.ipv4_cidr_blk
  resource_group    = data.ibm_resource_group.rg.id
}

module "ssh-keys" {
  source             = "./resources/security/ssh-keys"
  name               = var.vsi_ssh_keys_name
  public_key         = var.vsi_ssh_keys_public_key
  resource_group     = data.ibm_resource_group.rg.id
}

module "vsi" {
  source             = "./resources/compute/vsi"
  name               = "${var.vsi_name}"
  image              = data.ibm_is_image.stock_image.id
  profile            = "${var.vsi_profile}"
  vpc                = data.ibm_is_vpc.vpc.id
  zone               = "us-south-1"
  keys               = [module.ssh-keys.id]
  resource_group     = data.ibm_resource_group.rg.id
  subnet_id          = module.subnet[0].id
}
