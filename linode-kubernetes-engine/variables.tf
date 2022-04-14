variable "token" {}

variable "region" {
	default = "ap-northeast"
}

variable "lke-1" {
  type = object({
		k8s_version = string
		label = string
    tags = list(string)
  })	
	default = {
		k8s_version = "1.23"
		label = "lke-cluster"
		tags = ["testing"]
	}
}

variable "pools" {
  type = list(object({
    type = string
    count = number
  }))
  default = [
    {
      type = "g6-standard-1"
      count = 1
    },
    {
      type = "g6-standard-1"
      count = 1
    }
  ]
}
