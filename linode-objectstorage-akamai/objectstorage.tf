resource "linode_object_storage_key" "mykey" {
  label = "image-access"
}

resource "linode_object_storage_bucket" "mybucket" {
  access_key = linode_object_storage_key.mykey.access_key
  secret_key = linode_object_storage_key.mykey.secret_key

  cluster = var.region
  label   = var.label

  cors_enabled = true
  acl = "private"
}

resource "linode_object_storage_object" "index" {
  secret_key = linode_object_storage_key.mykey.secret_key
  access_key = linode_object_storage_key.mykey.access_key

  bucket = linode_object_storage_bucket.mybucket.label
  cluster = linode_object_storage_bucket.mybucket.cluster

  acl = "private"
  key = "index.html"
  source = pathexpand("./index.html")
  etag = filemd5(pathexpand("./index.html"))

  content_type = "text/html"
}
