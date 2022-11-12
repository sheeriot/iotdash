resource "azurerm_resource_group" "vm" {
  name     = "${local.hostname}_rg"
  location = var.location
}

resource "azurerm_public_ip" "surveyor" {
  name                    = "${local.hostname}_pip"
  resource_group_name     = azurerm_resource_group.vm.name
  location                = azurerm_resource_group.vm.location
  allocation_method       = "Static"
  sku                     = "Standard" 
  domain_name_label       = "${local.hostname}"
  idle_timeout_in_minutes = 30
}

resource "azurerm_network_interface" "surveyor" {
  name                = "${local.hostname}_nic"
  resource_group_name = azurerm_resource_group.vm.name
  location            = azurerm_resource_group.vm.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.surveyor.id
  }
}

resource "azurerm_linux_virtual_machine" "surveyor" {
  name                = "${local.hostname}"
  resource_group_name = azurerm_resource_group.vm.name
  location            = azurerm_resource_group.vm.location
  size                = "${var.vm_size}"
  lifecycle {
      ignore_changes = [
        custom_data,
        source_image_reference,
        admin_ssh_key
      ]
  }
  custom_data = base64encode(templatefile("scripts/cloud-init.tftpl", {
      hostname = local.hostname,
      username = var.vm_user,
      pubkey1 = file("${path.module}/pubkeys/${var.pubkey1_file}"),
      pubkey2 = file("${path.module}/pubkeys/${var.pubkey2_file}"),
      pubkey3 = file("${path.module}/pubkeys/${var.pubkey3_file}"),
    }))
  
  network_interface_ids = [
    "${azurerm_network_interface.surveyor.id}",
  ]
  os_disk {
    storage_account_type  = "Standard_LRS"
    caching               = "ReadWrite"
    disk_size_gb          = 50
  }
  source_image_reference {
    publisher = data.azurerm_platform_image.vm_image.publisher
    offer     = data.azurerm_platform_image.vm_image.offer
    sku       = data.azurerm_platform_image.vm_image.sku
    version   = data.azurerm_platform_image.vm_image.version
  }
  
  admin_username = "${var.vm_user}"

  admin_ssh_key {
    username   = "${var.vm_user}"
    public_key = file("${path.module}/pubkeys/${var.pubkey1_file}")
  }

}