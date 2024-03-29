data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "net1" {
    name                = "${local.net_env}-net"
    resource_group_name = "${local.net_env}-net_rg"
}

data "azurerm_subnet" "subnet1" {
    name                    = "subnet1"
    virtual_network_name    = "${local.net_env}-net"
    resource_group_name     = "${local.net_env}-net_rg"
}

data "azurerm_subnet" "subnet2" {
    name                    = "subnet2"
    virtual_network_name = "${local.net_env}-net"
    resource_group_name = "${local.net_env}-net_rg"
}
