resource "azurerm_network_security_group" "surveyor" {
  name                = "${local.hostname}_sg"
  location            = azurerm_resource_group.vm.location
  resource_group_name = azurerm_resource_group.vm.name
}

resource "azurerm_network_security_rule" "ssh_src1" {
  priority                    = 101
  name                        = "ssh_from_${var.ssh_src1name}"
  source_address_prefix       = var.ssh_src1
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_security_rule" "ssh_src2" {
  priority                    = 102
  name                        = "ssh_from_${var.ssh_src2name}"
  source_address_prefix       = var.ssh_src2
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

resource "azurerm_network_security_rule" "http80" {
  priority                    = 111
  name                        = "tcp80-http_from_any"
  source_address_prefix       = "*"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}

# Django port 8000 behind NGINX - use this rule to expose dev port (no-proxy by nginx)
# resource "azurerm_network_security_rule" "http8000" {
#   priority                    = 112
#   name                        = "tcp8000-http_from_any"
#   source_address_prefix       = "*"
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "8000"
#   destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
#   resource_group_name         = azurerm_resource_group.vm.name
#   network_security_group_name = azurerm_network_security_group.surveyor.name
# }

resource "azurerm_network_security_rule" "https443" {
  priority                    = 113
  name                        = "tcp8883-https_from_any"
  source_address_prefix       = "*"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}
resource "azurerm_network_security_rule" "tcp8883" {
  priority                    = 114
  name                        = "tcp8883-mqtts_from_any"
  source_address_prefix       = "*"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8883"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}
resource "azurerm_network_security_rule" "tcp8083_src1" {
  priority                    = 115
  name                        = "tcp8083-mqtt-wss_from_${var.ssh_src1name}"
  source_address_prefix       = var.ssh_src1
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8083"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}
resource "azurerm_network_security_rule" "tcp1883_src1" {
  priority                    = 116
  name                        = "tcp1883-mqtt_from_${var.ssh_src1name}"
  source_address_prefix       = var.ssh_src1
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1883"
  destination_address_prefix  = azurerm_network_interface.surveyor.private_ip_address
  resource_group_name         = azurerm_resource_group.vm.name
  network_security_group_name = azurerm_network_security_group.surveyor.name
}
resource "azurerm_network_interface_security_group_association" "iotdash" {
  network_interface_id      = azurerm_network_interface.surveyor.id
  network_security_group_id = azurerm_network_security_group.surveyor.id
}