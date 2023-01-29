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
  app_settings = {
    AZURE_LOG_LEVEL = "info"
    INFLUX_HOST = var.influx_host
    INFLUX_ORGID = var.influx_orgid
    MTAG1_BUCKET = var.mtag1_bucket
    MTAG1_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag1_reader.id})"
    MTAG1_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag1_writer.id})"
    MTAG2_BUCKET = var.mtag2_bucket
    MTAG2_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag2_reader.id})"
    MTAG2_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag2_writer.id})"
    MTAG0_BUCKET = var.mtag0_bucket
    MTAG0_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag0_reader.id})"
    MTAG0_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault_secret.mtag0_writer.id})"
  }
  # public key vault to permit access from Terraform hosts
  # needs Permitted IP list for Key Vault firewall
  allowed_keyvault = [
    "20.165.49.38/32",
    "108.215.4.163/32",
  ]
}