resource "azurerm_application_insights" "func" {
  name                = "${local.app_env}-insights"
  resource_group_name = azurerm_resource_group.func-rg.name
  location            = azurerm_resource_group.func-rg.location
  application_type    = "other"
  retention_in_days   = 30
}