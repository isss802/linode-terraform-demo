variable "token" {}

variable "domain" {
	default = {
		domain = "isss802.site"
	}
}

variable "node_count" {
	default = 1
}

variable "region" {
	default = "ap-northeast"
}

variable "wordpress" {
	default = {
		image = "linode/ubuntu20.04"
		type = "g6-nanode-1"
		group = "wordpress"
	}
}

variable "stackscript_id" {
	default = "996727"
}

variable "stackscript_data" {
	default = { 
		site_title = "WordPress Test Site"
		fqdn = "example.com"
		wp_admin = "admin"
		wp_password = "password"
		db_password = "password"
		soa_email_address = "example@example.com"
	}
}


variable "db" {
	default = {
		engine_id = "mysql/5.7.30"
		type = "g6-standard-1"
	}
}

variable "public_ssh_key" {
	default     = "~/.ssh/id_rsa.pub"
}

resource "random_string" "password" {
	length = 32
	special = true
	upper = true
	lower = true
	number = true
}
