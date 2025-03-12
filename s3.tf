resource "aws_s3_bucket" "processed_data" {
  bucket = "processed-data-bucket-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket_ownership_controls" "processed_data_ownership" {
  bucket = aws_s3_bucket.processed_data.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "processed_data_block" {
  bucket = aws_s3_bucket.processed_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
