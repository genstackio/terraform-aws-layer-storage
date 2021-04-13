output "bucket_userdocs_arn" {
  value = aws_s3_bucket.userdocs.arn
}
output "bucket_userdocs_name" {
  value = aws_s3_bucket.userdocs.id
}