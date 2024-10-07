resource "azurerm_windows_virtual_machine" "windows_server_vm" {
  count               = var.deploy_windows_server ? 1 : 0
  name                = "WindowsServer-${count.index}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.vm_size_windows
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_server_nic[count.index].id]
  os_disk {
    caching              = "ReadWrite"
    managed_disk_type    = "Standard"
    disk_size_gb         = 30
  }
}

resource "azurerm_network_interface" "windows_server_nic" {
  count               = var.deploy_windows_server ? 1 : 0
  name                = "nic-windows-server-${count.index}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig-${count.index}"
    subnet_id                     = azurerm_subnet.private_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
