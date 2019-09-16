#terraform module for virtual instances
#Author: Ramu Reddy V

resource "openstack_compute_instance_v2" "compute_1" {
  name = "labops-compute-lrt-tf-vserver1"
  flavor_id = var.flavorid
  image_id = var.imageid
  key_pair = var.keypairs
  security_groups = var.sgroup
  network {
    name = var.net_name
  } 
}

resource "openstack_compute_interface_attach_v2" "ai_to_vm_1" {
  instance_id = "${openstack_compute_instance_v2.compute_1.id}"
  port_id = var.portid
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.compute_1.id}"
  volume_id = var.volumeid
}

resource "openstack_compute_instance_v2" "sriov_compute" {
  name = "labops-compute-lrt-tf-sriov-server"
  flavor_id = var.flavorid
  image_id = var.imageid
  key_pair = var.keypairs
  security_groups = var.sgroup
  network {
    name = var.sriovnetname
    port = var.sriovport
  }
}  

resource "openstack_compute_instance_v2" "multi_vm-tf" {
  count = var.counts
  name = "${format("multi_vm-tf-%02d", count.index+1)}"
  flavor_id = var.flavorid
  image_id = var.imageid
  key_pair = var.keypairs
  security_groups =  var.sgroup
  network {
    name = var.net_name
  }
}


