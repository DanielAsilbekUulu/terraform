module "s3_bucket_dev" {   # you can give any name here
  source = "../s3_bucket_module"
  bucket_name = "our-dev-bucket"
}
