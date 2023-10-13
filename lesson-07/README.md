# Lesson 07

In this lesson I added a VSI to our infrastructure.

## Add the vsi module

I created a new Resource Family folder ```resources/compute``` and a ```vsi``` folder in it. There I created the ```vsi.tf``` file, check it out:

* [vsi.tf](resources/compute/vsi/vsi.tf)

As usual there are input and output variables. The VSI in the ```main.tf``` file is created [here](https://github.com/sasadangelo/terraform-tutorials/blob/8f7f20d24d3c88e21e49a64b615f7f4f24d302a0/lesson-07/main.tf#L66-L76).
