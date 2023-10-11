# Set region in IBM Cloud
variable "region" {
  default = "us-south"
}

# Resource group name which will contain all resources per environment (dev, stage, prd, etc)
variable "resource_group_name" {
  description = "Resource group name"
}
