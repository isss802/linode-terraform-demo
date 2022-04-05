resource "linode_instance" "wordpress" {
	count = var.node_count
	label = "wordpress-managed-${count.index + 1}"
	image = var.wordpress.image
	region = var.region
	type = var.wordpress.type
	authorized_keys = ["${chomp(file(var.public_ssh_key))}"]

	group = var.wordpress.group
	swap_size = 256
	root_pass = random_string.password.result
	private_ip = true

	stackscript_id = var.stackscript_id
	stackscript_data = {
		fqdn = var.stackscript_data.fqdn
		db_password = linode_database_mysql.db.0.root_password
		dbroot_password = linode_database_mysql.db.0.root_password
		db_host = linode_database_mysql.db.0.host_secondary
		site_title = var.stackscript_data.site_title
		wp_admin = var.stackscript_data.wp_admin
		wp_password = var.stackscript_data.wp_password
		soa_email_address = var.stackscript_data.soa_email_address
	}
}
