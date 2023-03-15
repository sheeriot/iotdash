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
    MTAG1_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag1_reader.name}/${azurerm_key_vault_secret.mtag1_reader.version})"
    MTAG1_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag1_writer.name}/${azurerm_key_vault_secret.mtag1_writer.version})"
    MTAG2_BUCKET = var.mtag2_bucket
    MTAG2_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag2_reader.name}/${azurerm_key_vault_secret.mtag2_reader.version})"
    MTAG2_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag2_writer.name}/${azurerm_key_vault_secret.mtag2_writer.version})"
    MTAG3_BUCKET = var.mtag3_bucket
    MTAG3_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag3_reader.name}/${azurerm_key_vault_secret.mtag3_reader.version})"
    MTAG3_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag3_writer.name}/${azurerm_key_vault_secret.mtag3_writer.version})"
    MTAG0_BUCKET = var.mtag0_bucket
    MTAG0_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag0_reader.name}/${azurerm_key_vault_secret.mtag0_reader.version})"
    MTAG0_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag0_writer.name}/${azurerm_key_vault_secret.mtag0_writer.version})"
    MTAG11_BUCKET = var.mtag11_bucket
    MTAG11_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag11_reader.name}/${azurerm_key_vault_secret.mtag11_reader.version})"
    MTAG11_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag11_writer.name}/${azurerm_key_vault_secret.mtag11_writer.version})"
    MTAG12_BUCKET = var.mtag12_bucket
    MTAG12_READER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag12_reader.name}/${azurerm_key_vault_secret.mtag12_reader.version})"
    MTAG12_WRITER = "@Microsoft.KeyVault(SecretUri=${azurerm_key_vault.dashfunc.vault_uri}secrets/${azurerm_key_vault_secret.mtag12_writer.name}/${azurerm_key_vault_secret.mtag12_writer.version})"

  }
  # public key vault to permit access from Terraform hosts
  # needs Permitted IP list for Key Vault firewall
  allowed_keyvault = [
    "20.165.49.38/32",
    "108.215.4.163/32",
  ]
}