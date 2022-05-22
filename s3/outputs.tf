# --- s3/outputs ---

output "aws_s3_bucket" {
  description = "S3 bucket names"
  value       = [for k in aws_s3_bucket.this : k.id]
}