variable "env" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "security_group_ids" {
  type    = list(string)
  default = null
}
variable "subnet_ids" {
  type    = list(string)
  default = null
}
variable "variables" {
  type    = map(string)
  default = {}
}
variable "policy_statements" {
  type = list(
  object({
    actions   = list(string),
    resources = list(string),
    effect    = string
  })
  )
  default = []
}
variable "config_file" {
  type = string
  default = ""
}
variable "plugins_file" {
  type = string
  default = ""
}
variable "utils_file" {
  type = string
  default = ""
}