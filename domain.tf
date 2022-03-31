resource "linode_domain" "domain" {
	type = "master"
	domain = var.domain.domain
	soa_email = data.linode_account.account.email
}

resource "linode_domain_record" "main" {
	domain_id = linode_domain.domain.id
	name = "www"
	record_type = "A"
	target = linode_nodebalancer.web-nodebalancer.ipv4
}
