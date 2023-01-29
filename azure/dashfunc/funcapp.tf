resource "azurerm_resource_group" "func-rg" {
  name     = "${local.app_env}-functions_rg"
  location = var.location
}

resource "azurerm_storage_account" "funcstore" {
  name                     = "${local.app_stor}funcstore"
  resource_group_name      = azurerm_resource_group.func-rg.name
  location                 = azurerm_resource_group.func-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "funcplan" {
  name                = "${local.app_env}-funcplan"
  resource_group_name = azurerm_resource_group.func-rg.name
  location            = azurerm_resource_group.func-rg.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "funcapp" {
  name                       = "${local.app_env}-funcapp"
  resource_group_name        = azurerm_resource_group.func-rg.name
  location                   = azurerm_resource_group.func-rg.location
  service_plan_id            = azurerm_service_plan.funcplan.id
  storage_account_name       = azurerm_storage_account.funcstore.name
  storage_account_access_key = azurerm_storage_account.funcstore.primary_access_key
  functions_extension_version = "~4"
  enabled                     = true
  https_only                  = true
  app_settings                = merge(local.app_settings, var.app_settings)

  site_config {
    application_insights_key = azurerm_application_insights.func.instrumentation_key
    application_insights_connection_string = azurerm_application_insights.func.connection_string
    minimum_tls_version = "1.2"
    http2_enabled       = true
    application_stack {
      python_version = var.python_version
    }
  }


}

