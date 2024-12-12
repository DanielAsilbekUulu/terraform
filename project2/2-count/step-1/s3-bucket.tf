resource "aws_s3_bucket" "bucket_outbound" {
  count         = 3
  bucket        = "${var.environment}-${var.region}-outbound-${count.index + 1}"   # if it's just ${count.index} then first bucket name will start from zero  but we provided here ${count.index+1} so it will start from one
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket" "bucket_inbound" {
  count         = 3
  bucket        = "${var.environment}-${var.region}-inbound-${count.index + 1}"
  force_destroy = var.force_destroy
}


