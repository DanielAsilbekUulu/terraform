module "s3_bucket_stage" {
  source = "../s3_bucket_module"
  bucket_name = "our-stage-bucket"
}