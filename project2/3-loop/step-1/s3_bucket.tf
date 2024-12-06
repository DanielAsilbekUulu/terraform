resource "aws_s3_bucket" "bucket" {
  for_each = var.buckets
  bucket = "${var.environment}-${var.region}-${each.value}"  #the result -->1. dev-us-east-1-outbound  ,2. dev-us-east-1-inbound  ,3. dev-us-east-1-daniel
  force_destroy = var.force_destroy
}