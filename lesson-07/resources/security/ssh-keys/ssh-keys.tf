terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "name" {}
variable "public_key" {}
variable "resource_group" {}

resource "ibm_is_ssh_key" "itself" {
  name           = var.name
  resource_group = var.resource_group
  public_key     = var.public_key
}

output "id" {
  value = ibm_is_ssh_key.itself.id
}

