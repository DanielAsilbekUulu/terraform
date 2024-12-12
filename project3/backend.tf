terraform {
  backend "s3" {                     # backend means where it's gonna store the tfstate file. so here it's s3 bucket. 
    bucket = "terraform-state-file-d"         # bucket name, where you want to upload that state file.     | key = ""  # key is just subfolders
    key = "project.tfstate-2"         #it is just a name of the file   # key is just subfolders  /terraform will create folder called tfstate in the terraform-state-file-d bucket  or it is just a name of the file
    region = "us-east-1"          # this is the region of the bucket. Not the region of the resources.
    encrypt = true               # it's a good practice to encrypt the state file and this is how you do it. You just put true there.
    dynamodb_table = "terraform_lock_hcl"       # it's for the lock file    # name of the table
  } 
}
