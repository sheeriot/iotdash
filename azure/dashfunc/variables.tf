variable "component" {
  type        = string
  description = "System Component Name - Name the Terraform Group"
}
variable "owner" {
  type        = string
  description = "Owner Name"
  default = "DevOps"
}
variable "location" {
  # default = "southcentralus"
}
variable "net_name" {
  type        = string
  description = "Name the Net"
  default = "iotdash"
}
variable "app_name" {
  type        = string
  description = "Name the app"
  default = "iotdash"
}
variable "env_name" {
  type        = string
  description = "Name the Environment"
}
variable "timezone" {
  default = "America/Chicago"
}
variable "kv_owner" {
  type = string
  description = "admin user for portal access"
  default = "78070f1c-ddb0-47dd-b1a4-d4d3f3c2b954"
}