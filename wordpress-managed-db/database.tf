resource "linode_database_mysql" "db" {
	count = var.node_count
	label = "database"
	engine_id = var.db.engine_id
	region = var.region
	type = var.db.type
	cluster_size = 1
	
	allow_list = ["192.168.128.0/17"]
}
