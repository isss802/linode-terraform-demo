resource "linode_database_mysql" "db" {
  label = "database"
  engine_id = var.db.engine_id
  region = var.region
  type = var.db.type
  cluster_size = 1
}

resource "linode_database_access_controls" "db" {
  count = var.node_count
  database_id = linode_database_mysql.db.id
  database_type = "mysql"

  allow_list = ["${element(linode_instance.wordpress.*.private_ip_address, count.index)}/32"]
}
