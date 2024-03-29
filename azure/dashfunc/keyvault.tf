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
    default_action  = "Allow"
    ip_rules        = local.allowed_keyvault
    # virtual_network_subnet_ids = [data.azurerm_subnet.subnet1.id,data.azurerm_subnet.subnet2.id]
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
resource "azurerm_role_assignment" "kvso-func" {
  scope = azurerm_key_vault.dashfunc.id
  role_definition_name = "Key Vault Secrets User"
  principal_id = azurerm_linux_function_app.funcapp.identity[0].principal_id
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
resource "azurerm_key_vault_secret" "mtag2_reader" {
  name         = "mtag2-reader"
  value        = "${var.mtag2_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag2_writer" {
  name         = "mtag2-writer"
  value        = "${var.mtag2_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag0_reader" {
  name         = "mtag0-reader"
  value        = "${var.mtag0_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag0_writer" {
  name         = "mtag0-writer"
  value        = "${var.mtag0_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag3_reader" {
  name         = "mtag3-reader"
  value        = "${var.mtag3_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag3_writer" {
  name         = "mtag3-writer"
  value        = "${var.mtag3_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag11_reader" {
  name         = "mtag11-reader"
  value        = "${var.mtag11_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag11_writer" {
  name         = "mtag11-writer"
  value        = "${var.mtag11_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag12_reader" {
  name         = "mtag12-reader"
  value        = "${var.mtag12_reader}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}
resource "azurerm_key_vault_secret" "mtag12_writer" {
  name         = "mtag12-writer"
  value        = "${var.mtag12_writer}"
  key_vault_id = azurerm_key_vault.dashfunc.id
  content_type = "api-token"
}