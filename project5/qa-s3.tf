module "s3_bucket_qa" {    #you can give any name
  source = "../s3_bucket_module"
  bucket_name = "our-qa-bucket"  #.index + 1
#  count = 50
}