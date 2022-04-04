resource "linode_nodebalancer" "web-nodebalancer" {
	label = "web-nodebalancer"
	region = var.region
}

resource "linode_nodebalancer_config" "web-nodebalancer-config" {
	nodebalancer_id = linode_nodebalancer.web-nodebalancer.id
	port = 80
	protocol = "http"
	check = "http_body"
	check_path = "/healthcheck/"
	check_body = "healthcheck"
	check_attempts = 30
	check_timeout = 25
	check_interval = 30
	stickiness = "http_cookie"
	algorithm = "roundrobin"
}

resource "linode_nodebalancer_node" "web-nodebalancer-node" {
	count = var.node_count
	nodebalancer_id = linode_nodebalancer.web-nodebalancer.id
	config_id = linode_nodebalancer_config.web-nodebalancer-config.id
	label = "web-node-${count.index + 1}"
	address = "${element(linode_instance.web.*.private_ip_address, count.index)}:80"
	mode = "accept"
}
