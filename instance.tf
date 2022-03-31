resource "linode_instance" "web" {
	count = var.node_count
	label = "web-${count.index + 1}"
	image = var.web.image
	region = var.region
	type = var.web.type
	authorized_keys = ["${chomp(file("~/.ssh/linode/id_rsa.pub"))}"]

	group = var.web.group
	swap_size = 256
	root_pass = random_string.password.result
	private_ip = true

	provisioner "remote-exec" {
		inline = [
			# install NGINX
			"export PATH=$PATH:/usr/bin",

			"apt-get -q update",
			"mkdir -p /var/www/html/",
			"mkdir -p /var/www/html/healthcheck",
			"echo healthcheck > /var/www/html/healthcheck/index.html",
			"echo node ${count.index + 1} > /var/www/html/index.html",
			"apt-get -q -y install nginx",
		]
		connection {
			type = "ssh"
			user = "root"
			password = random_string.password.result
			host = self.ip_address
		}
	}
}
