resource "azurerm_network_security_group" "surveyor" {
  name                = "${local.hostname}_sg"
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name
}

resource "azurerm_network_security_rule" "ssh_src1" {
  name                        = "ssh_from_${var.ssh_src1name}"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.ssh_src1
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_security_rule" "ssh_src2" {
  name                        = "ssh_from_${var.ssh_src2name}"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.ssh_src2
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_security_rule" "tcp8000_src1" {
  name                        = "tcp8000_from_${var.ssh_src1name}"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8000"
  source_address_prefix       = var.ssh_src1
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_security_rule" "tcp8000_src2" {
  name                        = "tcp8000_from_${var.ssh_src2name}"
  priority                    = 112
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8000"
  source_address_prefix       = var.ssh_src2
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_interface_security_group_association" "iotdash" {
  network_interface_id      = azurerm_network_interface.surveyor.id
  network_security_group_id = azurerm_network_security_group.surveyor.id
}