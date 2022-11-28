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
  type = string
  description = "Azure Location aka Region"
}
variable "net_name" {
  type        = string
  description = "Name the Net"
}
variable "env_name" {
  type        = string
  description = "Name the Environment"
}
