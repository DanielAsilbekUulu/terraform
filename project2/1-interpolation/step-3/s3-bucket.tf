#Create S3 bucket with policy for inbound and outbound email service.
#it is another way of doing step 2   #we only specify environment and region because your bucket name consists of environment,region,and some name (f.e dev-us-east-1-outbound)
resource "aws_s3_bucket" "bucket_outbound" { 
  bucket = "${var.environment}-${var.region}-outbound"  #so, here we hard coded the name      #instead of    "dev-us-east-1-outbound"    
  force_destroy = var.force_destroy
}


resource "aws_s3_bucket" "bucket_inbound" {
  bucket = "${var.environment}-${var.region}-inbound"     #instead of   "dev-us-ease-1-inbound"
  force_destroy = var.force_destroy
}






# bucket = "${var.environment}-${var.region}-inbound"   <-- you have to use old way of interpolation if you want to hard code some piece of it 
# bucket = var.environment-var.region-inbound        <-- this won't work 