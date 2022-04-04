data "linode_account" "account" {}

output "linode_account_email" {
	value = "${data.linode_account.account.email}"
}

output "linode_instance_ip" {
	value = "${linode_instance.wordpress.*.ip_address}"
}

output "linode_instance_password" {
	value = "${random_string.password.result}"
}
