resource "aws_s3_bucket" "bucket" {
  bucket = "${local.name_prefix}-s3"
  acl    = "private"
  region = "${lookup(local.region, local.environment)}"
  force_destroy = true
  versioning {
    enabled = true
  }
  tags = local.common_tags
}
