output "network_1" {
  value = "${openstack_networking_network_v2.network_1.name}"
}
output "sriov_network_1" {
  value = "${openstack_networking_network_v2.sriov_network_1.name}"
}

output "subnet_1" {
  value = "${openstack_networking_subnet_v2.subnet_1.name}"
}
output "sriov_subnet_1" {
  value = "${openstack_networking_subnet_v2.sriov_subnet_1.name}"
}
output "secgroup_1" {
  value = "${openstack_compute_secgroup_v2.secgroup_1.name}"
}
output "port_1" {
  value = "${openstack_networking_port_v2.port_1.id}"
}
output "sriov_port_1" {
  value = "${openstack_networking_port_v2.sriov_port1.id}"
}

output "port_1_name" {
  value = "${openstack_networking_port_v2.port_1.name}"
}
output "sriov_port_1_name" {
  value = "${openstack_networking_port_v2.sriov_port1.name}"
}
