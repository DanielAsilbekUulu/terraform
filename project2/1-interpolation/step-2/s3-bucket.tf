# this is interpolation (it doesn't have to be only var.   there are others too)

resource "aws_s3_bucket" "bucket_outbound" {        # "bucket_outbound" is the Terraform resource name.
  bucket = var.bucket_name_outbound             #this is the actual S3 bucket name 
  force_destroy = var.force_destroy
}


resource "aws_s3_bucket" "bucket_inbound" {         # "bucket_inbound" is the Terraform resource name.
  bucket = var.bucket_name_inbound           #this is the actual S3 bucket name  #'dev' if the ENV is dev.
  force_destroy = var.force_destroy     # This forcefully deletes the bucket, even if it contains objects. Normally, S3 buckets must be empty before they can be deleted.
}


