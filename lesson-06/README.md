# Lesson 06

HPCaaS uses a different approach from KubeCF. Basically, each IBM Cloud resource is created by a module and then there is a TF file (i.e. ```main.tf```) where you can decide, using a specific ```terraform.tfvars```how your resources must be deployed.

The code has a ```main.tf``` file where you decide how to create the resources, then you have a ```variables.tf``` file for variables. The ```terraform.tfvars``` represents the configuration and obviously it is not part of the repository but it is build by Schematics starting from the data entered by the user.

The ```resources``` folder is where all the resources modules are present. There is a subfolder for each Resource Family ```compute```, ```network```, ```security```, etc.

Now in this lesson I created in the ```network``` folder three modules for:

* VPC
* Public Gateways
* Subnets

In each folder, there is a single TF file for that module. You can explore them clicking the following links:

* [vpc.tf](resources/network/vpc/vpc.tf)
* [public_gw.tf](resources/network/public_gw/public_gw.tf)
* [subnets.tf](resources/network/subnets/subnets.tf)

