resource "aws_s3_bucket" "bukcet_outbound" {
  count = var.outbound_email ? 1 : 0     # if var.outbound_email is true, then 1 (means create), else (:), 0 (means don't create)
  bucket = "${var.environment}-${var.region}-outbound"
  force_destroy = var.force_destroy
}



resource "aws_s3_bucket" "bucket_inboud" {
  count = var.inbound_email ? 1 : 0
  bucket = "${var.environment}-${var.region}-inbound"
  force_destroy = var.force_destroy
}


