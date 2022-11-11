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

data "azurerm_platform_image" "ubuntu22" {
    location = var.location
    publisher  = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts-gen2"
    # version = "22.04.202211011"
}
