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
variable "python_version" {
  type = string
  description = "Python Version"
  default = "3.10"
}
variable "app_settings" {
  type = map
  description = "testing terraform features map and merge"
  default = {
    MTAG1_NAME = "AVD-Test1"
  }
}
variable "influx_host" {
  type = string
  description = "influx hostname"
}
variable "influx_orgid" {
  type = string
  description = "influx org-id"
}
variable "mtag1_bucket" {
  type = string
  description = "mtag1 bucket name"
}
variable "mtag1_reader" {
  type = string
  description = "Reader API Token for MTAG1 bucket"
}
variable "mtag1_writer" {
  type = string
  description = "Writer API Token for MTAG1 bucket"
}
