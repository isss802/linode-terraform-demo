variable "token" {}

variable "domain" {
	default = {
		domain = "example.com"
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

variable "public_ssh_key" {
	default = "~/.ssh/id_rsa.pub"
}

resource "random_string" "password" {
	length = 32
	special = true
	upper = true
	lower = true
	number = true
}
