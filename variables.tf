variable "token" {}

variable "domain" {
	default = {
		domain = "exsample.site"
	}
}

variable "node_count" {
	default = 2
}

variable "region" {
	default = "ap-northeast"
}

variable "web" {
	default = {
		image = "linode/ubuntu20.04"
		type = "g6-nanode-1"
		group = "web"
		tags = "web"
	}
}


resource "random_string" "password" {
    length = 32
    special = true
    upper = true
    lower = true
    number = true
}
