region                        = "us-south"
vsi_name                      = "my_vsi"
vsi_zone                      = "us-south-1"
vsi_subnet_name               = "us-south-vpc-subnet-20"
vsi_ip_octet                  = 74
vsi_with_fip                  = false
vsi_profile                   = "bx2-2x8"
vsi_os_image_name             = "ibm-redhat-8-3-minimal-amd64-3"
vsi_volumes_sizes_gb          = [100]
vsi_volume_profile            = "general-purpose"
# Generate a SSH Key pais with the command:
# $ ssh-keygen -t rsa
# then put here the public key.
vsi_keys                      = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDH0io55RYrRr4CAly6S9iGLtL3Wr3C+lJ7BD2VaYD5RGdYaPKh1iQi8TxFaj4nd9fM7JU9Za06QHyLLyL1Erx312G87oObiIxq0a1fhvOwNs07z/5VhjrVn6UbD8QJ5tR+atLndt3B1pOmng3FpOpLpQRXCMh4rN8hJ5Bp4gGVTtO1V34FqSvLdmFV9sYzeAdbe//jAbeqnNV2CkcDKOP5JryIxf3N89MbhwJwO35IvgyJgyJVAZiG9rSXgKeHOd91Ax3GeTKnCwHyyzoz9STg1ux/Ck/1zoYMlGFupuuA22KUl/5Fx61BYn2U00ZxueggLb/rL+qfKPe42sS7t4nObOURoSs9dxwBAcEb0PnKnSo36HgyoYLgvDHyaXvyRIzUm2vGo/JOtz/iUJonOR6v3OwbjLlhJCY5NsjrjwjbLBOowBf9s/6uoiSEYfaXVkGKjvuVi/BOfnrZCYF+eXtwI33pqVxiLdOtIIoMyfmh1dJCPaf+lkZuts+Il589NLk= sasadangelo@SalvatocBookNew"
]