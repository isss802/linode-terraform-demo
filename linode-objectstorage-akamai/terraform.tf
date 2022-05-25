terraform {
	required_providers {
		linode = {
			source	= "linode/linode"
		}
    akamai = {
      source = "akamai/akamai"
    }
	}
}

provider "linode" {
	token = "${var.token}"
}

provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = var.config_section
}
