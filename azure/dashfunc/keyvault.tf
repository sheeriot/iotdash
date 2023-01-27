resource "azurerm_key_vault" "dashfunc" {
  name                = "${local.app_env}-kv"
  resource_group_name = azurerm_resource_group.func-rg.name
  location            = azurerm_resource_group.func-rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                        = "standard"
  enabled_for_template_deployment = true
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false
  public_network_access_enabled   = false

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    key_permissions    = ["Get", ]
    secret_permissions = ["Get", ]
  }
  contact {
    # name = "your name"
    email = "sheeriot@example.com"
  }
}
