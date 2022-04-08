variable "token" {}

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
	default = "996728"
}

variable "stackscript_data" {
	default = { 
		db_password = "password"
		dbroot_password = "password"
		site_title = "test"
		wp_admin = "admin"
		wp_password = "password"
		soa_email_address = "example@example.com"
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
