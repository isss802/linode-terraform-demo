#########################
# Linode
#########################
variable "token" {}

# Linode Object Storageを立ち上げるリージョンを指定

variable "region" {
  default = "us-southeast-1"
}

# Linode Object Storageの名前を記載

variable "label" {
  default = "example"
}

#########################
# Akamai Property
#########################

variable "edgerc_path" {
  type    = string
  default = "~/.edgerc"
}

variable "config_section" {
  type    = string
  default = "default"
}

variable "env" {
  type    = string
  default = "staging"
}

# Group NameとContract ID(先頭にはctr_が必要)を記載する

variable "akamai_group" {
  default = {
    group_name = "example-group"
    contract_id = "ctr_XXXXXXXXXX"
  }
}

# CP Code Nameに任意の名前を設定する

variable "cpcode_name" {
  default = "example"
}

# Akamaiに割り当てるHostnameを指定する

variable "cname" {
  default = "hoge.example.com"
}

# Emailを記載

variable "email" {
  default = "hoge@example.com"
}

# EdgeHostnameを記載する

variable "edge_hostname" {
  default = "hoge-example-com.edgesuite.net"
}
