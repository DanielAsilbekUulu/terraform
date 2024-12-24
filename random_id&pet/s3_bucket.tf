# example of using random_id to generate a unique name for an s3 bucket. 

resource "aws_s3_bucket" "example" {
  bucket = "example-${random_pet.name.id}"  #we got random_pet.name.id from the second resource block 
}

resource "random_pet" "name" { #random_id&pet are resources, we have to specify resource block for them 
  length = 2  #this will create two different words 
}

#result:   s3_bucket_name = "example-measured-cougar"