data "akamai_group" "group" {
  group_name  = var.akamai_group.group_name
  contract_id = var.akamai_group.contract_id
}

data "akamai_property_rules_template" "rules" {
  template_file = abspath("${path.module}/property-snippets/main.json")
  variables {
    name = "hostname"
    value = "${linode_object_storage_bucket.mybucket.label}.${linode_object_storage_bucket.mybucket.cluster}.linodeobjects.com"
    type = "string"
  }
  variables {
    name = "region"
    value = "${linode_object_storage_bucket.mybucket.cluster}"
    type = "string"
  }
  variables {
    name = "access_key"
    value = "${linode_object_storage_key.mykey.access_key}"
    type = "string"
  }
  variables {
    name = "secret_key"
    value = "${linode_object_storage_key.mykey.secret_key}"
    type = "string"
  }
  variables {
    name = "cpcode_name"
    value = var.cpcode_name
    type = "string"
  }
  variables {
    name = "cpcode"
    value = replace(akamai_cp_code.dd.id, "cpc_", "")
    type = "number"
  }
}

resource "akamai_edge_hostname" "dd" {
  product_id    = "prd_Download_Delivery"
  contract_id   = data.akamai_group.group.contract_id
  group_id      = data.akamai_group.group.id
  ip_behavior   = "IPV6_COMPLIANCE"
  edge_hostname = var.edge_hostname
  use_cases = jsonencode([
    {
      "option" : "BACKGROUND",
      "type" : "GLOBAL",
      "useCase" : "Download_Mode"
    }
  ])
}

resource "akamai_property" "dd" {
  name        = var.cname
  contract_id = data.akamai_group.group.contract_id
  group_id    = data.akamai_group.group.id
  product_id  = "prd_Download_Delivery"
  rule_format = "latest"
  hostnames {
    cname_from             = var.cname
    cname_to               = akamai_edge_hostname.dd.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  rules = data.akamai_property_rules_template.rules.json
}

resource "akamai_property_activation" "dd" {
  property_id = akamai_property.dd.id
  contact     = [var.email]
  version     = akamai_property.dd.latest_version
  network     = upper(var.env)
  note        = "   "
}

resource "akamai_cp_code" "dd" {
  name = var.cpcode_name
  group_id = data.akamai_group.group.id
  contract_id = data.akamai_group.group.contract_id
  product_id = "prd_Download_Delivery"
}
