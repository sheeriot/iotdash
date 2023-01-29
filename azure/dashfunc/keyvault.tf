resource "azurerm_key_vault" "dashfunc" {
  name                = "${local.app_env}-kv"
  resource_group_name = azurerm_resource_group.func-rg.name
  location            = azurerm_resource_group.func-rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name                        = "standard"
  enable_rbac_authorization = true
  enabled_for_template_deployment = true
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  public_network_access_enabled   = true
  network_acls {
    bypass          = "AzureServices"
    default_action  = "Deny"
    ip_rules        = local.allowed_keyvault
  }
}

resource "azurerm_role_assignment" "kvco-tf" {
  scope = azurerm_key_vault.dashfunc.id
  role_definition_name = "Key Vault Crypto Officer"
  principal_id = data.azurerm_client_config.current.object_id
}
resource "azurerm_role_assignment" "kvso-tf" {
  scope = azurerm_key_vault.dashfunc.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id = data.azurerm_client_config.current.object_id
}
resource "azurerm_role_assignment" "kvco-kt" {
  scope = azurerm_key_vault.dashfunc.id
  role_definition_name = "Key Vault Crypto Officer"
  principal_id = var.kv_owner
}
resource "azurerm_role_assignment" "kvso-kt" {
  scope = azurerm_key_vault.dashfunc.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id = var.kv_owner
}

resource "azurerm_key_vault_secret" "mtag1_reader" {
  name         = "mtag1-reader"
  value        = "${var.mtag1_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag1_writer" {
  name         = "mtag1-writer"
  value        = "${var.mtag1_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "topping" {
  name         = "topping"
  value        = "onion"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "food"
}