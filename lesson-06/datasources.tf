data ibm_resource_group resource_group {
  name = "${var.region}-rg"
}

data "ibm_is_vpc" "vpc" {
    name = "${var.region}-rg-vpc"
}
