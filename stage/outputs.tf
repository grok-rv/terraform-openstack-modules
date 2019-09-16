#terraform outputs for all the applied resources from terraform apply tfplan

#Author: Ramu Reddy V


output "terraform-provider" {
  value = "connected with openstack at ${data.vault_generic_secret.stage_auth.data["auth_url"]}"
}

output "image-v2" {
  value =  "The image successfully created is ${module.resources.image_name}"
}

output "compute-flavor" {
  value = "The compute flavor successfully created is ${module.resources.flavor_name}"
}

output "compute-keypair" {
  value = "The compute keypairs created are ${module.resources.compute_keypair}"
}

output "block_storage" {
  value = module.resources.blockstorage
}
output "objectstorage-container" {
  value = "The object storage container created is ${module.resources.objectstorage_container}"
}
output "objectstorage-object" {
  value = "The object storage container object created is ${module.resources.objectstorage_object}"
}

output "network-1" {
  value = "Terraform succesfully created network ${module.networks.network_1}"
}
output "sriov-network-1" {
  value = "Terraform succesfully created sriov network ${module.networks.sriov_network_1}"
}

output "subnet-1" {
  value = "Terraform succesfully created subnet ${module.networks.subnet_1}"
}
output "sriov-subnet-1" {
  value = "Terraform succesfully created sriov subnet ${module.networks.sriov_subnet_1}"
}
output "secgroup-1" {
  value = "Terraform succesfully created security group ${module.networks.secgroup_1}"
}
output "port-1-name" {
  value = "Terraform successfully created port ${module.networks.port_1_name}"
}
output "sriov-port-1-name" {
  value = "Terraform succesfully created sriov port ${module.networks.sriov_port_1_name}"
}

output "compute_vm" {
  value = "Terraform successfully created vm ${module.instances.compute_1}"
}

output "sriov_compute_vm" {
  value = "Terraform successfully created vm ${module.instances.sriov_compute_1}"
}

output "multi_compute_vm" {
  value = module.instances.multi_vm
}

