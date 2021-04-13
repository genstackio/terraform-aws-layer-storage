module "lambda" {
  source             = "genstackio/lambda-base/aws"
  version            = "0.1.2"
  name               = var.name
  runtime            = var.runtime
  timeout            = var.timeout
  memory_size        = var.memory_size
  handler            = var.handler
  variables          = var.variables
  publish            = var.publish
  policy_statements  = var.policy_statements
  config_file        = var.config_file
  plugins_file       = var.plugins_file
  utils_file         = var.utils_file
  package_file       = "${path.module}/lambda-code.zip"
  code_dir           = "${path.module}/code"
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids
  providers          = {
    aws = aws
  }
}
