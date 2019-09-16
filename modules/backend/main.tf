variable "authurl" {}
variable "domainname" {}
variable "regionname" {}
variable "tenantid" {}
variable "username" {}
variable "passwd" {}

terraform {
  required_version = "=v0.12.6"
  backend "swift" {
    auth_url = var.authurl
    user_domain_name = var.domainname
    region_name = var.regionname
    tenant_id = var.tenantid
    user_name = var.username
    password = var.passwd 
    container = "terraform-state"
    archive_container = "terraform-state-archive"  
  }
}

