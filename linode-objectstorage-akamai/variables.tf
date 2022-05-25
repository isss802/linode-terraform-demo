#########################
# Linode
#########################
variable "token" {}

variable "region" {
  default = "us-southeast-1"
}

variable "label" {
  default = ""
}

#########################
# Akamai Property
#########################

variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "default"
}

variable "env" {
  type    = string
  default = "staging"
}

variable "akamai_group" {
  default = {
    group_name = ""
    contract_id = "ctr_"
  }
}

variable "cpcode_name" {
  default = ""
}

variable "cname" {
  default = ""
}

variable "email" {
  default = ""
}

variable "edge_hostname" {
  default = ".edgesuite.net"
}
