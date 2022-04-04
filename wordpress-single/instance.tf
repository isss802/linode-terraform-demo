resource "linode_instance" "wordpress" {
	count = var.node_count
	label = "wordpress-${count.index + 1}"
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
		db_password = var.stackscript_data.db_password
		dbroot_password = var.stackscript_data.dbroot_password
		site_title = var.stackscript_data.site_title
		wp_admin = var.stackscript_data.wp_admin
		wp_password = var.stackscript_data.wp_password
		soa_email_address = var.stackscript_data.soa_email_address
	}
}
