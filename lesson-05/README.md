# Lesson 05

In this lesson we will simplify a bit our code in order to remove unnecessary variables. The code base for this lesson is the [following repository](https://github.ibm.com/ibm-cloudfoundry/infrastructure).

## Simplify the code

Coding is an ongoing process and as you progress in your activity you notice that code could be improved. In our example, a few things can be simplified.

First of all, I decided to create all the resources in a Resource Group called "<region>-rg" so that I can reuse the ```region``` variable. I removed the ```resource_group_name``` from the ``env-variables.tf``` and ```terraform.tfvars``` files. Then in the ```main.tf```I changed the code like this:

```
data ibm_resource_group resource_group {
  name = "${var.region}-rg"
}
```

Then I defined the VPC in this way:

```
resource "ibm_is_vpc" "testacc_vpc" {
  name = "${var.region}-rg-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}
```

I removed the ```gw_info``` list from the ```env-variables.tf``` and ```terraform.tfvars```files, then in the ```main.tf```I changed the code in this way, where basically ```name``` and ```zone``` have been calculated starting from the ```region```:

```
resource "ibm_is_public_gateway" "vpc_gateways" {
  count = 3
  resource_group = data.ibm_resource_group.resource_group.id
  vpc            = ibm_is_vpc.testacc_vpc.id
  name           = "${var.region}-gateway-${count.index + 1}"
  zone           = "${var.region}-${count.index + 1}"
}
```

In the ```terraform.tfvars``` file I changed the structure ```subnet_info``` in this way because ```subnet_name``` and ```zone_name``` have been derived from the ```region``` variable.

```
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
```

In the ```main.tf``` I change these line in this way:

```
resource "ibm_is_subnet" "vpc_subnets" {
  for_each        = { for i,v in var.subnet_info: i => v }
  resource_group  = data.ibm_resource_group.resource_group.id
  vpc             = ibm_is_vpc.testacc_vpc.id
  # name is <region>-vpc-subnet-<subnet 3rd octect ip range>
  name            = "${var.region}-vpc-subnet-${element(split(".", each.value.ipv4_cidr_blk), 2)}"
  # name is <region>-<gw_index +1>
  zone            = "${var.region}-${each.value.gw_index + 1}"
  public_gateway  = ibm_is_public_gateway.vpc_gateways[each.value.gw_index].id
  ipv4_cidr_block = each.value.ipv4_cidr_blk
}
```

## Run the Terraform Plan

Use the same commands of the section in [Lesson 01 Readme file](../lesson-01/README.md#run-the-terraform-plan).
