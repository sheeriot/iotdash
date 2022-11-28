terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {}
}
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = true
      skip_shutdown_and_force_delete = true
    }
  }
}

locals {
  net_env = "${var.net_name}-${var.env_name}"
  iotcenter_name = "${var.net_name}-${var.env_name}-iotcenter"
  tags   = {
    network     = var.net_name
    environment = var.env_name
    infra_group = var.component
    owner       = var.owner
  }
}