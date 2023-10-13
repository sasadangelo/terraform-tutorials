# Terraform Tutorials

This repository contains a set of lessons to help you to use Terraform using the IBM Cloud Provider. The first 5 lessons use a code "KubeCF" style, lesson 06 and 07 use an HPCaaS style using modules.

## Lessons

The following lessons are a step by step process that show you, progressively, how to create a VPC in Terraform and how to add Public Gateways, Subnets, SSH Keys, and VSI using "KubeCF" and "HPCaaS" code style.
The code "HPCaaS" style comes from [this repository](https://github.com/terraform-ibm-modules/terraform-ibm-vpc).

* [Lesson 01 - Create a Virtual Private Cloud](lesson-01/README.md)
* [Lesson 02 - Use of the Variables](lesson-02/README.md)
* [Lesson 03 - Add the Public Gateways to the VPC](lesson-03/README.md)
* [Lesson 04 - Add the Subnets to the VPC](lesson-04/README.md)
* [Lesson 05 - Simplify code](lesson-05/README.md)
* [Lesson 06 - Start using module in HPCaaS style](lesson-06/README.md)
* [Lesson 07 - Add a VSI to the VPC](lesson-07/README.md)

## Where to go next?

Once you understand how modules works, it's easy to extend this code base looking at the HPCaaS code. Here few examples:

### Networking

* Here an example on how to add a VPN Gateway. [main.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L373-L380) [vpn.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/develop/resources/network/vpn/vpn.tf)
* Here an example how to add a VPN Connection. [main.tf]([https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L373-L380](https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L383-L393) [vpn_connection.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/develop/resources/network/vpn_connection/vpn_connection.tf)

### Compute

* Here an example on how to add a Floating IP. [main.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L274-L280) [floating_ip.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/develop/resources/network/floating_ip/floating_ip.tf)
* Here an example of Login VSI. [main.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L251-L272) [login_vsi.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/develop/resources/compute/login_vsi/login_vsi.tf)

### Storage

* Here an example on how to add a File Storage. [main.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/f91ed34214f01e51c2ce3da5b7c6e7538f4da93e/main.tf#L282-L290) [file.tf](https://github.ibm.com/workload-eng-services/HPCaaS/blob/develop/resources/storage/file/file.tf)

Now it should be easy for you to understand how the HPCaaS code base works.
