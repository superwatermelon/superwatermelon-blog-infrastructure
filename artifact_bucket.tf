resource "aws_s3_bucket" "artifacts" {
  bucket = "${var.artifact_bucket}"
  acl    = "private"
}
