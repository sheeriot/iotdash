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
variable "username" {
  default = "yourname"
}
variable "ssh_src1" {
  default = "108.215.4.163"
}
variable "ssh_src1name" {
  default = "5702HB"
}
variable "ssh_src2" {
  default = "37.247.51.34"
}
variable "ssh_src2name" {
  default = "noisy"
}
variable "pubkey1_file" {
  type = string
  description = "first public key for remote access"
  default = "ssh_kt-mbpro20.pub"
}
variable "pubkey2_file" {
  type = string
  description = "second public key for remote access"
  default = "ssh_kt-noisy.pub"
}
variable "pubkey3_file" {
  type = string
  description = "third public key for remote access"
  default = "ssh_kt-imac17.pub"
}
variable "vm_name" {
  type = string
  description = "vm name"
  default = "surveyor0"
}