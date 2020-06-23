# terraform-openstack-modules
--------------------------------------------------------------------------------------------------------------
This repo is for creating openstack infrastructure using modules for compute, network, storage resources and secrets using vault in dev environment and swift container backend

# Requirements
-----------------------------------------------------------------------------------------------------
Terraform version= v0.12.6

Openstack provider = v1.22.0

provider.vault: version = "~> 2.3"

openstack provider credentials are stored on the vault dev server as kv secrets

# Issue 
https://github.com/terraform-providers/terraform-provider-openstack/issues/733

