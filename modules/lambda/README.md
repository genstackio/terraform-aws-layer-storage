# AWS Storage Terraform module

Terraform module which creates a Lambda with a ready-to-use NodeJS source code to handle
storage (files) events on AWS.

## Usage

```hcl
module "lambda-userdocs" {
  source = "genstackio/layer-storage/aws//modules/lambda"

  // ...
}
```
