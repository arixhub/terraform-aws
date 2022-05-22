# Multiple S3 Buckets

Terraform code will create multiple S3 buckets with:
- It will add prefix Project and Application name to bucket name
- It will add random suffix to bucket name to create globally unique S3 name
- Versioning Enabled for each bucket
- TLS Policy attached for each bucket
- Server-Side Encryption is Enabled for each bucket

### How to use it

1. Rename the `example.tfvars` file in `tfvars` folder to your desired name.
2. Adjust the variables inside tfvars file.
3. Apply it with:
```s
terraform apply -var-file=tfvars/example.tfvars
```
> change the _example.tfvars_ to the name of your tfvars file.

## Output

Output Example:

```
aws_s3_bucket = [
  "example-project-example-app-bucket-1-f544b3ad59fe324e",
  "example-project-example-app-bucket-2-d906b5df5c173eaf",
  "example-project-example-app-bucket-3-dd71a57bd310dbd1",
]
```
---

# Troubleshoot
This Terraform code use AWS Profile, to set the AWS Profile credentails, following code should exist in your `~/.aws/credentials`
```
[example-profile]
aws_access_key_id=*******
aws_secret_access_key=******
```
> change example-profile to the replaced name used in _example.tfvars_
> paste access and secret key
