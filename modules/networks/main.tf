resource "openstack_networking_network_v2" "network_1" {
  name = "labops-compute-lrt-tf-network_1"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "sriov_network_1" {
  name = "labops-compute-lrt-tf-sriov-network_1"
  admin_state_up = "true"
  segments {
    physical_network = "sriovnet1"
    network_type = "vlan"
    segmentation_id = "115"
  }
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name = "labops-compute-lrt-tf-subnet_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr = "10.20.30.0/24"
}

resource "openstack_networking_subnet_v2" "sriov_subnet_1" {
  name = "labops-compute-lrt-tf-sriov-subnet_1"
  network_id = "${openstack_networking_network_v2.sriov_network_1.id}"
  cidr = "10.10.10.0/24"
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = "labops-compute-lrt-tf-secgroup_1"
  description = "a security group for lrt compute"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_networking_port_v2" "port_1" {
  name = "labops-compute-lrt-tf-port_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  admin_state_up = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]
  fixed_ip {
    subnet_id  = "${openstack_networking_subnet_v2.subnet_1.id}"
    ip_address = "10.20.30.25"
  }
}

resource "openstack_networking_port_v2" "sriov_port1" {
  name = "labops-compute-lrt-tf-sriov-port_1"
  network_id = "${openstack_networking_network_v2.sriov_network_1.id}"
  admin_state_up = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]
  fixed_ip {
    subnet_id = "${openstack_networking_subnet_v2.sriov_subnet_1.id}"
  }
  binding  {
    vnic_type = "direct"
  }
}
