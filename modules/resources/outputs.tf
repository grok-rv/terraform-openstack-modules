output "image_v2" {
  value =  "${openstack_images_image_v2.test-tf-rancheros.id}"
}

output "compute_flavor" {
  value = "${openstack_compute_flavor_v2.test-tf-flavor.id}"
}

output "compute_keypair" {
  value = "${openstack_compute_keypair_v2.test-tf-keypair.name}"
}

output "blockstorage" {
  value = openstack_blockstorage_volume_v2.test-tf-volume[*].id
}

output "objectstorage_container" {
  value = "${openstack_objectstorage_container_v1.container_1.name}"
}
output "objectstorage_object" {
  value = "${openstack_objectstorage_object_v1.doc_1.name}"
}

output "image_name" {
  value =  "${openstack_images_image_v2.test-tf-rancheros.name}"
}

output "flavor_name" {
  value = "${openstack_compute_flavor_v2.test-tf-flavor.name}"
}

