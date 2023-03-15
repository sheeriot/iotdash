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
  #   MTAG1_NAME = "MTAG-MTop"
  #   MTAG2_NAME = "MTAG-MFTD"
  #   MTAG3_NAME = "Everynet-FTD"
  #   MTAG0_NAME = "MTAG-GlobalSat"
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
variable "mtag2_bucket" {
  type = string
  description = "mtag2 bucket name"
}
variable "mtag2_reader" {
  type = string
  description = "Reader API Token for MTAG2 bucket"
}
variable "mtag2_writer" {
  type = string
  description = "Writer API Token for MTAG2 bucket"
}
variable "mtag0_bucket" {
  type = string
  description = "mtag0 bucket name"
}
variable "mtag0_reader" {
  type = string
  description = "Reader API Token for MTAG0 bucket"
}
variable "mtag0_writer" {
  type = string
  description = "Writer API Token for MTAG0 bucket"
}
variable "mtag3_bucket" {
  type = string
  description = "mtag3 bucket name"
}
variable "mtag3_reader" {
  type = string
  description = "Reader API Token for MTAG3 bucket"
}
variable "mtag3_writer" {
  type = string
  description = "Writer API Token for MTAG3 bucket"
}
variable "mtag11_bucket" {
  type = string
  description = "mtag11 bucket name"
}
variable "mtag11_reader" {
  type = string
  description = "Reader API Token for MTAG11 bucket"
}
variable "mtag11_writer" {
  type = string
  description = "Writer API Token for MTAG11 bucket"
}
variable "mtag12_bucket" {
  type = string
  description = "mtag12 bucket name"
}
variable "mtag12_reader" {
  type = string
  description = "Reader API Token for MTAG12 bucket"
}
variable "mtag12_writer" {
  type = string
  description = "Writer API Token for MTAG12 bucket"
}