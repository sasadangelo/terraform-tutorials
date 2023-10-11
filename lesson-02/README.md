# Lesson 02

In this lesson we will learn how to use variables so that you can deploy the same infrastructure in multiple environments (development, staging, and production) just changing them. This lesson use the same code of [Lesson 01](../lesson-01/README.md) but know it leverages on the variables.

## Use of the variables

First of all, you must understand which parameters will change in your deployment across the different environments. Our example is very simple and we just have two variables that we can define in a ```terraform.tfvars``` file:

```
resource_group_name = "test-per-db"
region = "us-south"
```

In order to use these variables you must declare them in a .tf file that we will call ```env-variables.tf```:

```
variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
}

variable "region" {
  default = "us-south"
}

variable "resource_group_name" {
  description = "Resource group name"
}
```

You can notice that if a region variable is not specified its default value will be ```us-south```. Moreover, for the API Key we will declare the variable ```ibmcloud_api_key```

Now you can use these two variables here in the ```main.tf``` file:

```
data ibm_resource_group resource_group {
  name = var.resource_group_name
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}
```

Since the VPC name is ```<resource group name>-vpc``` we can change the code in the following way:

```
resource "ibm_is_vpc" "testacc_vpc" {
  name = "${var.resource_group_name}-vpc"
  resource_group = data.ibm_resource_group.resource_group.id
}
```

Notice the use of ```${var.resource_group_name}``` to create the VPC name.

## Run the Terraform Plan

Use the same commands of the section in [Lesson 01 Readme file](../lessn-01/README.md).
