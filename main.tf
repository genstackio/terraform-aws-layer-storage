resource "aws_s3_bucket" "userdocs" {
  bucket = var.bucket_name
  acl    = "private"
}
resource "aws_s3_bucket_notification" "userdocs-to-lambda" {
  bucket = aws_s3_bucket.userdocs.id
  lambda_function {
    lambda_function_arn = module.lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}
resource "aws_lambda_permission" "userdocs-to-lambda" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.userdocs.arn
}

module "lambda" {
  source        = "./modules/lambda"
  name          = "${var.env}-userdocs"
  handler       = "index.handler"
  timeout       = 600
  memory_size   = 512
  policy_statements = concat([
    {
      actions   = ["s3:ListBucket"]
      resources = [aws_s3_bucket.userdocs.arn]
      effect    = "Allow"
    },
    {
      actions   = ["s3:GetObject", "s3:Put*", "s3:GetObjectTagging", "s3:DeleteObject*"]
      resources = ["${aws_s3_bucket.userdocs.arn}/*"]
      effect    = "Allow"
    },
  ], var.policy_statements)
  variables          = var.variables
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  config_file        = var.config_file
  plugins_file       = var.plugins_file
  utils_file         = var.utils_file
  providers = {
    aws = aws
  }
}