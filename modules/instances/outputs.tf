output "compute_1" {
  value = "Terraform succesfully created vserver ${openstack_compute_instance_v2.compute_1.name} using the image, keypair, flavor, network, port , security-group and attached 2 block storage devices"

}

output "sriov_compute_1" {
  value = "Terraform succesfully created a sriov vm ${openstack_compute_instance_v2.sriov_compute.name} using the image, keypair, flavor, security-group and sriov network  attached"
}

output "multi_vm" {
  value = openstack_compute_instance_v2.multi_vm-tf[*].name
}

