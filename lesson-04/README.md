# Lesson 04

In this lesson we will learn how to add the Subnets to the VPC created in the [Lesson 01](../lesson-01/README.md).

## VPC Subnets in the IBM Cloud

In the context of IBM Cloud's Virtual Private Cloud (VPC), a Subnet is a fundamental networking concept that plays a crucial role in organizing and segmenting your cloud resources within your private network. Subnets are building blocks within your VPC, allowing you to divide your private network into smaller, more manageable segments.

Key Aspects of Subnets in IBM Cloud VPC are:

* **Segmentation**: Subnets help you logically divide your VPC into smaller address ranges, which can be used to group similar resources together. This segmentation is particularly useful for organizing workloads, enhancing security, and optimizing network traffic.

* **Isolation**: Each subnet operates as an isolated network segment, and you can apply specific security rules and policies to control the traffic within and to/from the subnet. This isolation enhances security and ensures that communication is limited to the designated scope.

* **Customization**: IBM Cloud VPC allows you to customize your subnets by defining their IP address ranges and associating them with specific network security groups. This level of customization offers flexibility in designing your network architecture.

* **Connectivity**: Subnets can be connected to one another or to other VPCs through route tables and peering connections, enabling the seamless flow of traffic between different segments of your VPC or even between multiple VPCs.

In this README, we will provide insights into the concept of subnets within an IBM Cloud VPC and explain how to create and manage them effectively. Understanding subnets is essential for designing a network infrastructure that meets your specific requirements, whether it's for hosting virtual machines, containerized applications, or other cloud resources.

## Add the Subnets to the VPC

We need to add four Subnets for each Availability Zone. To do that, add the following lines in the ```main.tf```.

```
resource "ibm_is_subnet" "vpc_subnets" {
  for_each        = { for i,v in var.subnet_info: i => v }
  resource_group  = data.ibm_resource_group.resource_group.id
  vpc             = ibm_is_vpc.testacc_vpc.id
  name            = each.value.subnet_name
  zone            = each.value.zone_name
  public_gateway  = ibm_is_public_gateway.vpc_gateways[each.value.gw_index].id
  ipv4_cidr_block = each.value.ipv4_cidr_blk
}
```

Notice the for loop throught the Subnets list ```subnet_info``` declared in the ```env-variables.tf``` file:

```
variable "subnet_info" {
  description = "Map of subnets specific info"
  type        = list

  default     = []
}
```

The declaration specifies only that the structure is a list with no default, the actual values are in the ```terraform.tfvars``` file:

```
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
```

## Run the Terraform Plan

Use the same commands of the section in [Lesson 01 Readme file](../lesson-01/README.md#run-the-terraform-plan).
