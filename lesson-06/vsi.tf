# Define a data source to retrieve an IBM Cloud resource group
data ibm_resource_group vsi_resource_group {
  name = "${var.region}-rg"
}

data "ibm_is_vpc" "vsi_vpc" {
  name = "${var.region}-rg-vpc"
}

data "ibm_is_image" "vsi_osimage" {
  name  = var.vsi_os_image_name
}

data "ibm_is_ssh_key" "vsi_sshkeys" {
  count           = length(var.vsi_keys)
  name            = var.vsi_keys[count.index]
}

resource "ibm_is_instance" "vsi_instance" {
  name                = "${var.vsi_name}"
  resource_group      = data.ibm_resource_group.vsi_resource_group.id
  vpc                 = data.ibm_is_vpc.vsi_vpc.id
  zone                = var.vsi_zone
  keys                = data.ibm_is_ssh_key.vsi_sshkeys[*].id
  image               = data.ibm_is_image.vsi_osimage.id
  profile             = var.vsi_profile
  auto_delete_volume  = false

  volumes = ibm_is_volume.vsi_volumes[*].id

  primary_network_interface {
    subnet          = element(data.ibm_is_subnet.subnet_info[*], var.vsi_subnet_index).id
    #security_groups = [ibm_is_security_group.vsi_sg1.id]
    primary_ipv4_address = cidrhost(element(data.ibm_is_subnet.subnet_info[*], var.vsi_subnet_index).ipv4_cidr_block, var.vsi_ip_octet)
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to image, e.g. because iaas updates the id per their liking.
      image
    ]
    prevent_destroy = false
  }
}

resource "ibm_is_volume" "vsi_volumes" {
  name            = "${var.vsi_name}-volumes-${count.index}"
  count           = length(var.vsi_volumes_sizes_gb)
  profile         = var.vsi_volume_profile
  zone            = var.vsi_zone
  capacity        = var.vsi_volumes_sizes_gb[count.index]
  resource_group  = data.ibm_resource_group.vsi_resource_group.id
}

# Floating Public IP for VSI
resource "ibm_is_floating_ip" "vsi_fip" {
  count  = var.vsi_with_fip ? 1:0
  name   = "${var.vsi_name}-fip1"
  target = ibm_is_instance.vsi_instance.primary_network_interface[0].id
  resource_group  = data.ibm_resource_group.vsi_resource_group.id
}