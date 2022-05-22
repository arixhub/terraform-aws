# --- s3/data ---

##################################################################################
# S3 Bucket - IAM Policy
##################################################################################
data "aws_iam_policy_document" "this" {
  for_each = aws_s3_bucket.this
  statement {
    sid     = "RequireTLS"
    effect  = "Deny"
    actions = ["s3:*"]

    resources = [
      each.value.arn,
      "${each.value.arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "NumericLessThan"
      variable = "s3:TlsVersion"
      values   = ["1.2"]
    }

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}
