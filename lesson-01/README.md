# Lesson 01

In this lesson we will learn how to create a Virtual Cloud Network (VPC) where our resources (Virtual Server Instances, etcc) will be created. The code base for this lesson is the [following repository](https://github.ibm.com/ibm-cloudfoundry/infrastructure).

## What is a Virtual Private Cloud?

A Virtual Private Cloud (VPC) is a fundamental networking service on the IBM Cloud platform that provides a secure and isolated environment for your cloud resources. It allows you to create and manage your own private network, providing a high degree of control over your cloud infrastructure.

### Key Features:

* **Isolation**: VPCs create a private, logically isolated network where you can deploy your virtual machines, containers, and other cloud resources. This isolation enhances security and data privacy.

* **Customization**: With VPC, you can define your network's IP address ranges, subnets, and routing rules. This level of customization enables you to design a network that aligns with your specific requirements.

* **Security**: IBM Cloud VPC includes robust security features, such as security groups and network access controls, to protect your resources from unauthorized access and threats.

* **Scalability**: VPCs are highly scalable, allowing you to expand your network as your business grows. You can add or remove resources within your VPC with ease.

* **Global Reach**: IBM Cloud VPCs can span multiple regions, enabling you to build a global network infrastructure that serves your users and applications wherever they are located.

In this README, we will provide the method to create a VPC via Terraform.

## Create a VPC with Terraform

Create a ```main.tf``` file with the following content.

First of all, you must tell to the Terraform plan that you're using the IBM Cloud provider. It will download the latest version after the ```1.12.0```.

```
terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.12.0"
    }
  }
}
```

In the IBM Cloud all the resources must be created in a Resource Group. This is valid also for VPC. In this example I assume you already have a Resource Group called ```test-per-db``` with write access.

Add the resource group in the ```main.tf``` file.

```
data ibm_resource_group resource_group {
  name = "test-per-db"
}
```

Declare a variable for the API Key required to run the Terraform plan:

```
variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
}
```

Configure the IBM Cloud Provider targetting the ```us-south``` region and using your API key variable.

```
provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = "us-south"
}
```

Create the VPC referencing the Resource group above.

```
resource "ibm_is_vpc" "testacc_vpc" {
  name = "test-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}
```

## Run the Terraform Plan

To run the terraform plan use the following commands:

```
git clone https://github.com/sasadangelo/terraform-tutorials
cd terraform-tutorials/lesson-01
terraform init
terraform apply -var="ibmcloud_api_key=xxxxxxxx"
```

where ```xxxxxxxx``` is you IBM Cloud API Key.

To destroy the VPC run the command:

```
terraform destroy -var="ibmcloud_api_key=xxxxxxxx"
```

