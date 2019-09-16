#terraform openstack provider and security using vault for NC region 

#Author: Ramu Reddy V

#TF_LOG=DEBUG

data "vault_generic_secret" "stage_auth" {
  path = "secret/stage"
}


provider "openstack" {
  version = "1.22"
  auth_url = "${data.vault_generic_secret.stage_auth.data["auth_url"]}"
  user_domain_name = "${data.vault_generic_secret.stage_auth.data["user_domain_name"]}"
  region = "${data.vault_generic_secret.stage_auth.data["region"]}"
  tenant_id = "${data.vault_generic_secret.stage_auth.data["tenant_id"]}"
  user_name = "${data.vault_generic_secret.stage_auth.data["user_name"]}"
  password = "${data.vault_generic_secret.stage_auth.data["password"]}"
}


module "resources" {
  source = "../modules/resources"
  region = "${data.vault_generic_secret.stage_auth.data["region"]}"

}

module "networks" {
  source = "../modules/networks"
}

module "instances" {
  source = "../modules/instances"
  flavorid = "${module.resources.compute_flavor}"
  imageid = "${module.resources.image_v2}"
  keypairs = "${module.resources.compute_keypair}"
  sgroup = ["${module.networks.secgroup_1}"]
  net_name = "${module.networks.network_1}"
  portid = "${module.networks.port_1}"
  sriovnetname = "${module.networks.sriov_network_1}"
  sriovport = "${module.networks.sriov_port_1}"
  volumeid = "${module.resources.blockstorage[0]}"

}

module "backend" {
  source = "../modules/backend"
  authurl = "${data.vault_generic_secret.stage_auth.data["auth_url"]}"
  domainname = "${data.vault_generic_secret.stage_auth.data["user_domain_name"]}"
  regionname = "${data.vault_generic_secret.stage_auth.data["region"]}"
  tenantid = "${data.vault_generic_secret.stage_auth.data["tenant_id"]}"
  username = "${data.vault_generic_secret.stage_auth.data["user_name"]}"
  passwd = "${data.vault_generic_secret.stage_auth.data["password"]}"
}
