# This Terraform code creates two AWS S3 buckets:
# dev-us-east-1-outbound (outbound bucket)
# dev-us-east-1-inbound (inbound bucket)

# this is how we create s3 buckets!

resource "aws_s3_bucket" "bucket_outbound" {        # "bucket_outbound" is the Terraform resource name.
  bucket = "dev-us-east-1-outbound"               #this is the actual S3 bucket name 
  force_destroy = true
}

resource "aws_s3_bucket" "bucket_inbound" {         # "bucket_inbound" is the Terraform resource name.
  bucket = "dev-us-east-1-inbound"               #this is the actual S3 bucket name  #'dev' if the ENV is dev.
  force_destroy = true     # This forcefully deletes the bucket, even if it contains objects. Normally, S3 buckets must be empty before they can be deleted.
}