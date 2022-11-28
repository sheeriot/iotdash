resource "azurerm_resource_group" "iotcentral" {
  name     = "${local.iotcenter_name}_rg"
  location = var.location
}

resource "azurerm_iotcentral_application" "iothub" {
  name                = local.iotcenter_name
  resource_group_name = azurerm_resource_group.iotcentral.name
  location            = var.location
  sub_domain          = local.iotcenter_name

  display_name = local.iotcenter_name
  sku          = "ST1"

}