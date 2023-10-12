# Lesson 03

In this lesson we will learn how to add the Public Gateways to the VPC created in the [Lesson 01](../lesson-01/README.md).

## VPC Public Gateways in the IBM Cloud

In an IBM Cloud Virtual Private Cloud (VPC), the concept of "public gateways" is an important one. A public gateway is a networking component that serves as an entry point for traffic coming into the VPC from the internet. Here's what it serves in a VPC, especially when there is one public gateway per zone:

* **Internet Connectivity**: A public gateway in each zone provides a means for your VPC resources, such as virtual servers or other services, to connect to the internet. It allows incoming and outgoing internet traffic to flow to and from your resources within the VPC.

* **High Availability**: By having a public gateway in each zone, you ensure high availability and redundancy. If one zone experiences an issue, traffic can be routed through the public gateway in another zone, minimizing potential downtime.

* **Zonal Isolation**: It helps in isolating traffic within specific zones. Resources in one zone can access the internet through their respective public gateway without affecting resources in other zones.

* **Security and Control**: Public gateways can be configured with security rules and access controls to manage incoming and outgoing traffic. This enables you to control and secure the network traffic to and from your VPC resources.

* **Load Balancing and Content Delivery**: Public gateways can be combined with other services like load balancers or content delivery networks to distribute traffic and optimize performance.

* **Compliance and Data Privacy**: In cases where data residency or regulatory requirements are involved, having separate public gateways per zone can help you meet compliance standards by keeping data traffic within specific geographic areas.

In summary, public gateways in each zone of an IBM Cloud VPC provide essential internet connectivity, redundancy, and security for your VPC resources. They play a crucial role in enabling your VPC to interact with the external world while maintaining control and isolation within the VPC.

## Add the Public Gateways to the VPC

We need to add a Public Gateway for each Availability Zone. To do that, add the following lines in the ```main.tf```.

```
resource "ibm_is_public_gateway" "vpc_gateways" {
  for_each       = { for i,v in var.gw_info: i => v }
  resource_group = data.ibm_resource_group.resource_group.id
  vpc            = ibm_is_vpc.testacc_vpc.id
  name           = each.value.gw_name
  zone           = each.value.zone_name
}
```

Notice the for loop throught the Public Gateways list declared in the ```env-variables.tf``` file:

```
variable "gw_info" {
  description = "Map of public gateways specific info"
  type        = list

  default     = []
}
```

The declaration specifies only that the structure is a list with no default, the actual values are in the ```terraform.tfvars``` file:
Now you can use these two variables here in the ```main.tf``` file:

```
gw_info = [
  { gw_name = "us-south-gateway-1", zone_name = "us-south-1" },
  { gw_name = "us-south-gateway-2", zone_name = "us-south-2" },
  { gw_name = "us-south-gateway-3", zone_name = "us-south-3" }
]
```

## Run the Terraform Plan

Use the same commands of the section in [Lesson 01 Readme file](../lesson-01/README.md#run-the-terraform-plan).
