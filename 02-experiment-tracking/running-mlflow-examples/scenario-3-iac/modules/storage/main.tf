data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "mlops" {
  bucket           = format("mlops-artifacts-%s-%s-an", data.aws_caller_identity.current.account_id, var.aws_region)
  bucket_namespace = "account-regional"
}
