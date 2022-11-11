terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.18.0"
    }
  }
}
provider "azurerm" {
  features {}
}

locals {
  net_env = "${var.net_name}-${var.env_name}_net"
  tags   = {
    network = var.net_name
    environment = var.env_name
    infra_group = var.component
    owner       = var.owner
  }
}