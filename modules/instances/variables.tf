variable "counts" {
  description = "number of count"
  default = "3"
}

variable "flavorid" {
  description = "falvor id"
}

variable "imageid" {
  description = "image id"
}

variable "keypairs" {
  description = "key pair to be used for vm"
}

variable "sgroup" {
  description = "security groyp to be used"
}

variable "net_name" {
  description = "network name"
}

variable "portid" {
  description = "port to be used"
}

variable "sriovnetname" {
  description = "sriov net to be used"
}

variable "sriovport" {
  description = "sriov port to be used"
}

variable "volumeid" {
  description = "volume to be used"
}
