resource "linode_firewall" "firewall" {
	label = "firewall"
	tags	= ["test"]

	inbound {
		label		 = "allow-http"
		action	 = "ACCEPT"
		protocol = "TCP"
		ports		 = "80"
		ipv4		 = ["0.0.0.0/0"]
		ipv6		 = ["::/0"]
	}

	inbound {
		label		 = "allow-https"
		action	 = "ACCEPT"
		protocol = "TCP"
		ports		 = "443"
		ipv4		 = ["0.0.0.0/0"]
		ipv6		 = ["::/0"]
	}

	inbound {
		label		 = "allow-ssh"
		action	 = "ACCEPT"
		protocol = "TCP"
		ports		 = "22"
		ipv4		 = ["0.0.0.0/0"]
		ipv6		 = ["::/0"]
	}

	inbound_policy = "DROP"
	outbound_policy = "ACCEPT"

	linodes = linode_instance.wordpress.*.id
}
