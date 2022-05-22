# --- s3/s3 ---

##################################################################################
# S3 BUCKET
##################################################################################

resource "aws_s3_bucket" "this" {
  for_each      = var.s3_bucket_name
  bucket        = "${local.name_prefix}-${each.key}-${random_id.random[each.key].hex}"
  force_destroy = var.force_destroy

  tags = {
    Project     = var.project_name
    Application = var.application_name
  }

  lifecycle {
    ignore_changes = [tags, logging]
  }
}

resource "aws_s3_bucket_acl" "this" {
  for_each = aws_s3_bucket.this
  bucket   = each.value.id
  acl      = "private"
}

resource "aws_s3_bucket_versioning" "this" {
  for_each = aws_s3_bucket.this
  bucket   = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  for_each = aws_s3_bucket.this
  bucket   = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = aws_s3_bucket.this
  bucket   = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_policy.this]
}


resource "aws_s3_bucket_policy" "this" {
  for_each = aws_s3_bucket.this
  bucket   = each.value.id

  policy = data.aws_iam_policy_document.this[each.key].json
}