output "nodebalancer_ip_address" {
    value = linode_nodebalancer.web-nodebalancer.ipv4
}

data "linode_account" "account" {}

output "linode_account_email" {
        value = "${data.linode_account.account.email}"
}

output "linode_instance_ip" {
  value = "${linode_instance.web.*.ip_address}"
}

output "linode_instance_password" {
  value = "${random_string.password.result}"
}
