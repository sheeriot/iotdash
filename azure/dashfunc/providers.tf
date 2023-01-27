terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {}
}
provider "azurerm" {
  features {}
}

locals {
  net_env = "${var.net_name}-${var.env_name}"
  app_env = "${var.app_name}-${var.env_name}"
  app_stor = "${var.app_name}${var.env_name}"
  tags   = {
    network = var.net_name
    application = var.app_name
    environment = var.env_name
    infra_group = var.component
    owner       = var.owner
  }
}