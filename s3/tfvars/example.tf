# --- s3/tfvars ---

#Project Variables
aws_region = "us-east-1" #Change it to desired AZ
aws_profile = "example_profile"
project_name = "example-project"
application_name = "example-app"

# S3
s3_bucket_name = ["bucket-1", "bucket-2", "bucket-3"] #Can be expanded to more buckets
force_destroy = true #Default is false