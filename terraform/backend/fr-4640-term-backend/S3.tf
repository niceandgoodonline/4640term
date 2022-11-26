resource "aws_kms_key" "fr_4640_term_kms_key" {
  description         = "This key is used to encrypt bucket objects in 4640-term-backend"
  enable_key_rotation = true
  policy              = data.aws_iam_policy_document.fr_4640_term_backend_kms_policy.json

  tags = var.tags
}


resource "aws_s3_bucket" "fr_4640_term_backend" {
  bucket = var.bucket
  tags = var.tags
}

resource "aws_s3_bucket_acl" "fr_4640_term_backend_acl" {
  bucket = aws_s3_bucket.fr_4640_term_backend.id
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "fr_4640_term_backend_kms_config" {
  bucket = aws_s3_bucket.fr_4640_term_backend.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.fr_4640_term_kms_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
